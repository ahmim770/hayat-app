import SwiftUI
import UIKit

struct MedicationsView: View {
    @EnvironmentObject var appState: AppState
    @State private var showingAddMedication = false
    
    var body: some View {
        ZStack {
            HayatBackground()
            Group {
                if appState.medications.isEmpty {
                    VStack(spacing: 16) {
                        Image(systemName: "pills.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                        Text(appState.localized("No Medications"))
                            .font(.title2)
                            .fontWeight(.bold)
                        Text(appState.localized("Add your medications to track them easily."))
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                } else {
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(appState.medications) { medication in
                                NavigationLink(destination: MedicationDetailView(medication: medication)) {
                                    MedicationCard(medication: medication)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding()
                    }
                }
            }
        }
        .navigationTitle(appState.localized("Medications"))
        .toolbar {
            Button {
                showingAddMedication = true
            } label: {
                Image(systemName: "plus")
            }
        }
        .sheet(isPresented: $showingAddMedication) {
            AddMedicationSheet()
        }
    }
}

struct AddMedicationSheet: View {
    @EnvironmentObject var appState: AppState
    @Environment(\.dismiss) var dismiss
    @Environment(\.openURL) private var openURL
    
    @State private var name = ""
    @State private var dosage = ""
    @State private var frequency = ""
    @State private var durationOption = "1 Week"
    @State private var customDurationDays = ""
    @State private var startDate = Date()
    @State private var remindersEnabled = false
    @State private var reminderStartTime = Calendar.current.date(from: DateComponents(hour: 8, minute: 0)) ?? Date()
    @State private var remindersPerDay = 1
    @State private var showingNotificationsDisabledAlert = false
    
    let durationOptions = ["1 Week", "2 Weeks", "1 Month", "2 Months", "Custom"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text(appState.localized("Medication Details"))) {
                    TextField(appState.localized("Medication Name"), text: $name)
                    TextField(appState.localized("Dosage (e.g., 500mg)"), text: $dosage)
                    TextField(appState.localized("Frequency (e.g., Twice daily)"), text: $frequency)
                }
                
                Section(header: Text(appState.localized("Duration"))) {
                    Picker(appState.localized("Duration"), selection: $durationOption) {
                        ForEach(durationOptions, id: \.self) { option in
                            Text(appState.localized(option)).tag(option)
                        }
                    }
                    
                    if durationOption == "Custom" {
                        TextField(appState.localized("Days"), text: $customDurationDays)
                            .keyboardType(.numberPad)
                    }
                    
                    DatePicker(appState.localized("Start Date"), selection: $startDate, displayedComponents: .date)
                }

                Section {
                    Toggle(appState.localized("Remind me to take this medication"), isOn: $remindersEnabled.animation(.easeInOut(duration: 0.2)))
                }

                if remindersEnabled {
                    Section(header: Text(appState.localized("Reminder Options"))) {
                        DatePicker(
                            appState.localized("First Reminder Time"),
                            selection: $reminderStartTime,
                            displayedComponents: .hourAndMinute
                        )

                        Picker(appState.localized("How many times a day"), selection: $remindersPerDay) {
                            ForEach(1...4, id: \.self) { count in
                                Text("\(count)").tag(count)
                            }
                        }

                        Text(reminderSummary)
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                    .transition(.opacity.combined(with: .move(edge: .top)))
                }
            }
            .navigationTitle(appState.localized("Add Medication"))
            .animation(.easeInOut(duration: 0.2), value: remindersEnabled)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(appState.localized("Cancel")) { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(appState.localized("Save")) {
                        Task {
                            await handleSaveMedication()
                        }
                    }
                    .disabled(name.isEmpty || dosage.isEmpty || frequency.isEmpty)
                }
            }
            .onChange(of: remindersEnabled) { _, newValue in
                guard newValue else { return }
                Task {
                    let granted = await MedicationReminderManager.shared.requestPermissionIfNeeded()
                    if !granted {
                        await MainActor.run {
                            remindersEnabled = false
                            showingNotificationsDisabledAlert = true
                        }
                    }
                }
            }
            .alert(appState.localized("Notifications Disabled"), isPresented: $showingNotificationsDisabledAlert) {
                Button(appState.localized("Open Settings")) {
                    if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                        openURL(settingsURL)
                    }
                }
                Button(appState.localized("Cancel"), role: .cancel) { }
            } message: {
                Text(appState.localized("Please allow notifications in Settings to receive medication reminders."))
            }
        }
    }
    
    private var reminderSummary: String {
        "\(appState.localized("You will be reminded")) \(remindersPerDay) \(appState.localized("times per day")) \(appState.localized("starting at")) \(reminderStartTime.formatted(date: .omitted, time: .shortened))"
    }

    private func handleSaveMedication() async {
        if remindersEnabled {
            let granted = await MedicationReminderManager.shared.requestPermissionIfNeeded()
            guard granted else {
                await MainActor.run {
                    remindersEnabled = false
                    showingNotificationsDisabledAlert = true
                }
                return
            }
        }

        await saveMedication()
    }

    @MainActor
    private func saveMedication() {
        var durationString = durationOption
        var calculatedEndDate = Date()
        
        let calendar = Calendar.current
        var daysToAdd = 0
        
        switch durationOption {
        case "1 Week": daysToAdd = 7
        case "2 Weeks": daysToAdd = 14
        case "1 Month": daysToAdd = 30
        case "2 Months": daysToAdd = 60
        case "Custom":
            if let days = Int(customDurationDays) {
                daysToAdd = days
                durationString = "\(days) Days"
            } else {
                daysToAdd = 7 // Default fallback
            }
        default: daysToAdd = 7
        }
        
        if let date = calendar.date(byAdding: .day, value: daysToAdd, to: startDate) {
            calculatedEndDate = date
        }
        
        let newMedication = Medication(
            name: name,
            dosage: dosage,
            frequency: frequency,
            startDate: startDate,
            duration: durationString,
            endDate: calculatedEndDate,
            remindersEnabled: remindersEnabled,
            reminderStartTime: remindersEnabled ? reminderStartTime : nil,
            remindersPerDay: remindersEnabled ? remindersPerDay : nil
        )
        appState.medications.append(newMedication)
        dismiss()
    }
}

struct MedicationCard: View {
    let medication: Medication
    @EnvironmentObject var appState: AppState
    
    var progress: Double {
        let totalTime = medication.endDate.timeIntervalSince(medication.startDate)
        let elapsedTime = Date().timeIntervalSince(medication.startDate)
        
        if totalTime <= 0 { return 1.0 }
        if elapsedTime < 0 { return 0.0 }
        return min(max(elapsedTime / totalTime, 0.0), 1.0)
    }
    
    var progressColor: Color {
        if progress < 0.5 {
            return Color(red: progress * 2, green: 1.0, blue: 0.0) // Green to Yellow
        } else {
            return Color(red: 1.0, green: (1.0 - progress) * 2, blue: 0.0) // Yellow to Red
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top) {
                Image(systemName: "pills.fill")
                    .font(.title2)
                    .foregroundColor(.green)
                    .padding(8)
                    .background(Color.green.opacity(0.1))
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(medication.name)
                        .font(.headline)
                        .foregroundColor(.primary)
                    Text("\(medication.dosage) • \(medication.frequency)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                NavigationLink(destination: PharmacyListView()) {
                    Text(appState.localized("Find Pharmacy"))
                        .font(.caption)
                        .fontWeight(.bold)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(Color.brandBlue.opacity(0.1))
                        .foregroundColor(.brandBlue)
                        .cornerRadius(8)
                }
                .buttonStyle(PlainButtonStyle())
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(appState.localized("Treatment Progress"))
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(String(format: "%.0f%% %@", progress * 100, appState.localized("Completed")))
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }
                
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        Capsule()
                            .frame(width: geometry.size.width, height: 12)
                            .opacity(0.1)
                            .foregroundColor(.gray)
                        
                        Capsule()
                            .frame(width: min(CGFloat(progress) * geometry.size.width, geometry.size.width), height: 12)
                            .foregroundColor(progressColor)
                            .animation(.linear, value: progress)
                    }
                }
                .frame(height: 12)
            }
        }
        .padding()
        .background(Color(uiColor: .secondarySystemGroupedBackground))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}

struct MedicationDetailView: View {
    let medication: Medication
    @EnvironmentObject var appState: AppState
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    var progress: Double {
        let totalTime = medication.endDate.timeIntervalSince(medication.startDate)
        let elapsedTime = Date().timeIntervalSince(medication.startDate)
        
        if totalTime <= 0 { return 1.0 }
        if elapsedTime < 0 { return 0.0 }
        return min(max(elapsedTime / totalTime, 0.0), 1.0)
    }
    
    var progressColor: Color {
        if progress < 0.5 {
            return Color(red: progress * 2, green: 1.0, blue: 0.0) // Green to Yellow
        } else {
            return Color(red: 1.0, green: (1.0 - progress) * 2, blue: 0.0) // Yellow to Red
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Header
                VStack(spacing: 16) {
                    Image(systemName: "pills.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.green)
                        .padding()
                        .background(Color.green.opacity(0.1))
                        .clipShape(Circle())
                    
                    Text(medication.name)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("\(medication.dosage) • \(medication.frequency)")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
                .padding()
                
                // Progress Bar
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text(appState.localized("Treatment Progress"))
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Spacer()
                        Text(String(format: "%.0f%% %@", progress * 100, appState.localized("Completed")))
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                    }
                    
                    GeometryReader { geometry in
                        ZStack(alignment: .leading) {
                            Capsule()
                                .frame(width: geometry.size.width, height: 12)
                                .opacity(0.1)
                                .foregroundColor(.gray)
                            
                            Capsule()
                                .frame(width: min(CGFloat(progress) * geometry.size.width, geometry.size.width), height: 12)
                                .foregroundColor(progressColor)
                                .animation(.linear, value: progress)
                        }
                    }
                    .frame(height: 12)
                }
                .padding()
                .background(Color(uiColor: .secondarySystemGroupedBackground))
                .cornerRadius(16)
                .padding(.horizontal)
                
                // Details Card
                VStack(alignment: .leading, spacing: 16) {
                    DetailRow(label: appState.localized("Start Date"), value: medication.startDate.formatted(date: .long, time: .omitted))
                    DetailRow(label: appState.localized("End Date"), value: medication.endDate.formatted(date: .long, time: .omitted))
                    DetailRow(label: appState.localized("Duration"), value: appState.localized(medication.duration))
                }
                .padding()
                .background(Color(uiColor: .secondarySystemGroupedBackground))
                .cornerRadius(16)
                .padding(.horizontal)

                VStack(alignment: .leading, spacing: 16) {
                    DetailRow(
                        label: appState.localized("Reminders Enabled"),
                        value: appState.localized(medication.remindersEnabled ? "Enabled" : "Disabled")
                    )

                    if medication.remindersEnabled, let reminderStartTime = medication.reminderStartTime {
                        DetailRow(
                            label: appState.localized("Reminder Time"),
                            value: reminderStartTime.formatted(date: .omitted, time: .shortened)
                        )

                        DetailRow(
                            label: appState.localized("Reminder Frequency"),
                            value: "\(medication.remindersPerDay ?? 1) \(appState.localized("times per day"))"
                        )
                    }
                }
                .padding()
                .background(Color(uiColor: .secondarySystemGroupedBackground))
                .cornerRadius(16)
                .padding(.horizontal)
                
                Spacer()
                
                Button(role: .destructive) {
                    showingDeleteAlert = true
                } label: {
                    HStack {
                        Image(systemName: "trash")
                        Text(appState.localized("Delete Medication"))
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(16)
                }
                .padding()
            }
        }
        .navigationTitle(appState.localized("Medication Details"))
        .background(HayatBackground())
        .alert(appState.localized("Delete Medication?"), isPresented: $showingDeleteAlert) {
            Button(appState.localized("Delete"), role: .destructive) {
                deleteMedication()
            }
            Button(appState.localized("Cancel"), role: .cancel) { }
        } message: {
            Text(appState.localized("Are you sure you want to remove this medication?"))
        }
    }
    
    private func deleteMedication() {
        if let index = appState.medications.firstIndex(where: { $0.id == medication.id }) {
            // Remove from data source immediately
            appState.medications.remove(at: index)
            
            // Force persistence explicitly
            if let encoded = try? JSONEncoder().encode(appState.medications) {
                UserDefaults.standard.set(encoded, forKey: "medications")
                UserDefaults.standard.synchronize()
            }
            
            // Dismiss view
            dismiss()
        }
    }
}
