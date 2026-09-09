import Foundation
import UserNotifications

final class MedicationReminderManager {
    static let shared = MedicationReminderManager()

    private let center = UNUserNotificationCenter.current()
    private let identifierPrefix = "medication-reminder-"

    private init() {}

    func requestPermissionIfNeeded() async -> Bool {
        let settings = await notificationSettings()

        switch settings.authorizationStatus {
        case .authorized, .provisional, .ephemeral:
            return true
        case .notDetermined:
            return (try? await center.requestAuthorization(options: [.alert, .sound, .badge])) ?? false
        case .denied:
            return false
        @unknown default:
            return false
        }
    }

    func syncNotifications(for medications: [Medication]) async {
        await removeAllMedicationNotifications()

        guard await requestPermissionIfNeededSilently() else { return }

        for medication in medications where medication.remindersEnabled {
            await scheduleNotifications(for: medication)
        }
    }

    private func requestPermissionIfNeededSilently() async -> Bool {
        let settings = await notificationSettings()

        switch settings.authorizationStatus {
        case .authorized, .provisional, .ephemeral:
            return true
        case .notDetermined, .denied:
            return false
        @unknown default:
            return false
        }
    }

    private func scheduleNotifications(for medication: Medication) async {
        guard
            let reminderStartTime = medication.reminderStartTime,
            let remindersPerDay = medication.remindersPerDay,
            remindersPerDay > 0
        else { return }

        let reminderDates = scheduledReminderDates(
            startDate: medication.startDate,
            endDate: medication.endDate,
            reminderStartTime: reminderStartTime,
            remindersPerDay: remindersPerDay
        )

        for (index, reminderDate) in reminderDates.enumerated() where reminderDate > Date() {
            let content = UNMutableNotificationContent()
            content.title = "Medication Reminder"
            content.body = "\(medication.name) • \(medication.dosage)"
            content.sound = .default

            let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: reminderDate)
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            let request = UNNotificationRequest(
                identifier: "\(identifierPrefix)\(medication.id.uuidString)-\(index)",
                content: content,
                trigger: trigger
            )

            try? await addNotificationRequest(request)
        }
    }

    private func scheduledReminderDates(
        startDate: Date,
        endDate: Date,
        reminderStartTime: Date,
        remindersPerDay: Int
    ) -> [Date] {
        let calendar = Calendar.current
        let startDay = calendar.startOfDay(for: startDate)
        let endDay = calendar.startOfDay(for: endDate)
        let reminderTimeComponents = calendar.dateComponents([.hour, .minute], from: reminderStartTime)
        let intervalMinutes = remindersPerDay > 1 ? 12 * 60 / (remindersPerDay - 1) : 0

        var reminderDates: [Date] = []
        var currentDay = startDay

        while currentDay <= endDay {
            guard let firstReminder = calendar.date(bySettingHour: reminderTimeComponents.hour ?? 8, minute: reminderTimeComponents.minute ?? 0, second: 0, of: currentDay) else {
                break
            }

            for occurrence in 0..<remindersPerDay {
                let reminderDate = calendar.date(byAdding: .minute, value: occurrence * intervalMinutes, to: firstReminder) ?? firstReminder
                reminderDates.append(reminderDate)
            }

            guard let nextDay = calendar.date(byAdding: .day, value: 1, to: currentDay) else {
                break
            }

            currentDay = nextDay
        }

        return reminderDates
    }

    private func removeAllMedicationNotifications() async {
        let pendingRequests = await pendingNotificationRequests()
        let medicationRequestIds = pendingRequests
            .map(\.identifier)
            .filter { $0.hasPrefix(identifierPrefix) }

        center.removePendingNotificationRequests(withIdentifiers: medicationRequestIds)
        center.removeDeliveredNotifications(withIdentifiers: medicationRequestIds)
    }

    private func notificationSettings() async -> UNNotificationSettings {
        await withCheckedContinuation { continuation in
            center.getNotificationSettings { settings in
                continuation.resume(returning: settings)
            }
        }
    }

    private func pendingNotificationRequests() async -> [UNNotificationRequest] {
        await withCheckedContinuation { continuation in
            center.getPendingNotificationRequests { requests in
                continuation.resume(returning: requests)
            }
        }
    }

    private func addNotificationRequest(_ request: UNNotificationRequest) async throws {
        try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
            center.add(request) { error in
                if let error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(returning: ())
                }
            }
        }
    }
}
