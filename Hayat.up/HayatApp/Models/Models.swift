import Foundation

struct RadiologyResult: Identifiable {
    let id = UUID()
    let title: String
    let date: Date
    let status: String
    let hospital: String
    let reportUrl: String 
}

struct MedicalReport: Identifiable {
    let id = UUID()
    let title: String
    let doctorName: String
    let date: Date
    let summary: String
}

struct Allergy: Identifiable, Codable {
    var id = UUID()
    let allergen: String
    let severity: String // "Mild", "Moderate", "Severe"
    let reaction: String
    let notes: String
}

struct Insurance: Identifiable, Codable {
    var id = UUID()
    let provider: String
    let policyNumber: String
    let memberId: String
    let expiryDate: Date
    let coverageType: String // "Gold", "Silver", "Platinum"
}

struct Doctor: Identifiable {
    let id = UUID()
    let name: String
    let specialty: String
    let hospital: String
    let intro: String
    let rating: Double
    let imageName: String
    // Richer information
    var education: String = "Medical Degree"
    var languages: [String] = ["Arabic", "English"]
    var experience: Int = 10
    var patientsServed: Int = 1000
}

struct Pharmacy: Identifiable {
    let id = UUID()
    let name: String
    let location: String
    let isOpen: Bool
    let rating: Double
    let imageName: String
}

struct Hospital: Identifiable {
    let id = UUID()
    let name: String
    let location: String
    let imageName: String
    let phoneNumber: String
}

struct Medication: Identifiable, Codable {
    var id = UUID()
    let name: String
    let dosage: String
    let frequency: String
    let startDate: Date
    let duration: String
    let endDate: Date
    let remindersEnabled: Bool
    let reminderStartTime: Date?
    let remindersPerDay: Int?

    init(
        id: UUID = UUID(),
        name: String,
        dosage: String,
        frequency: String,
        startDate: Date,
        duration: String,
        endDate: Date,
        remindersEnabled: Bool = false,
        reminderStartTime: Date? = nil,
        remindersPerDay: Int? = nil
    ) {
        self.id = id
        self.name = name
        self.dosage = dosage
        self.frequency = frequency
        self.startDate = startDate
        self.duration = duration
        self.endDate = endDate
        self.remindersEnabled = remindersEnabled
        self.reminderStartTime = reminderStartTime
        self.remindersPerDay = remindersPerDay
    }

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case dosage
        case frequency
        case startDate
        case duration
        case endDate
        case remindersEnabled
        case reminderStartTime
        case remindersPerDay
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(UUID.self, forKey: .id) ?? UUID()
        name = try container.decode(String.self, forKey: .name)
        dosage = try container.decode(String.self, forKey: .dosage)
        frequency = try container.decode(String.self, forKey: .frequency)
        startDate = try container.decode(Date.self, forKey: .startDate)
        duration = try container.decode(String.self, forKey: .duration)
        endDate = try container.decode(Date.self, forKey: .endDate)
        remindersEnabled = try container.decodeIfPresent(Bool.self, forKey: .remindersEnabled) ?? false
        reminderStartTime = try container.decodeIfPresent(Date.self, forKey: .reminderStartTime)
        remindersPerDay = try container.decodeIfPresent(Int.self, forKey: .remindersPerDay)
    }
}

enum AppLanguage: String {
    case english = "English"
    case arabic = "العربية"
}
