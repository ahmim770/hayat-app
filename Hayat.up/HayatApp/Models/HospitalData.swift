import Foundation

struct HospitalData {
    private static let primaryHospitals: [Hospital] = [
        Hospital(name: "Saudi German Hospital".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "9200 07997"),
        Hospital(name: "KIMSHEALTH Medical Center (Jarir)".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "011 477 7471"),
        Hospital(name: "KIMSHEALTH Medical Center Jarir".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "011 477 7471"),
        Hospital(name: "Aster Sanad Hospital".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "9200 04417"),
        Hospital(name: "Kingdom Hospital & Consulting Clinics".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "9200 00751"),
        Hospital(name: "Dallah Hospital".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "9200 12222"),
        Hospital(name: "Dallah Hospital – Namar".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "9200 12222"),
        Hospital(name: "King Faisal Specialist Hospital & Research Centre".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "011 464 7272"),
        Hospital(name: "King Fahad Medical City".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "011 288 9999"),
        Hospital(name: "King Saud Medical City".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "011 288 8888"),
        Hospital(name: "King Khalid University Hospital".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "011 467 7300"),
        Hospital(name: "King Saud University Medical City".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "011 467 7300"),
        Hospital(name: "Prince Sultan Military Medical City".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "011 477 7777"),
        Hospital(name: "Prince Mohammed Bin Abdulaziz Hospital (NGHA)".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "011 461 8888"),
        Hospital(name: "King Abdulaziz Medical City (National Guard)".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "011 429 9999"),
        Hospital(name: "National Guard Health Affairs".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "011 429 9999"),
        Hospital(name: "Riyadh Military Hospital".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "011 477 7777"),
        Hospital(name: "Al Hammadi Hospital – Olaya".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "011 462 2000"),
        Hospital(name: "Al Hammadi Hospital – Nuzha".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "011 462 2000"),
        Hospital(name: "Riyadh Care Hospital".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "011 437 8888"),
        Hospital(name: "Care National Hospital".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "011 437 8888"),
        Hospital(name: "Al Mouwasat Hospital".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "9200 04477"),
        Hospital(name: "Mouwasat Hospital".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "9200 04477"),
        Hospital(name: "Al Iman General Hospital".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "011 447 1900"),
        Hospital(name: "Al Yamamah Hospital".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "800 127 7000"),
        Hospital(name: "Dar Al Shifa Hospital".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "9200 08843"),
        Hospital(name: "Specialized Medical Center (SMC)".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "011 434 3800"),
        Hospital(name: "Saudi British Hospital".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "011 461 1111"),
        Hospital(name: "Dr. Sulaiman Al Habib Hospital – Olaya".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "011 525 9999"),
        Hospital(name: "Dr. Sulaiman Al Habib Hospital – Al Suwaidi".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "011 525 9999"),
        Hospital(name: "Al Habib Medical Center – Al Takhassusi".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "011 261 4444"),
        Hospital(name: "Habib Medical Group – Al Rayyan".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "011 490 9999"),
        Hospital(name: "Dr. Sulaiman Al Habib Medical Group".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "011 490 9999"),
        Hospital(name: "Al Faisal Specialist Hospital".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "011 462 2000"),
        Hospital(name: "Almoosa Specialist Hospital".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "011 462 2000"),
        Hospital(name: "King Salman Hospital".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "011 462 2000"),
        Hospital(name: "National Hospital".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), location: "Riyadh".replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines), imageName: "building.2.fill", phoneNumber: "011 462 2000")
    ]

    private static let supplementalHospitals: [Hospital] = [
        "Aesthetic Surgery Center – Riyadh",
        "Al Noor Specialist Dental Clinic – Riyadh",
        "Al Salama Hospital – Riyadh",
        "Dr. Erfan & Bagedo General Hospital – Riyadh",
        "Gastro & Liver Center – Riyadh",
        "Gulf Dental Specialist Clinic – Riyadh",
        "Heart & Vascular Hospital – Riyadh",
        "Hera General Hospital – Riyadh",
        "International Medical Center – Riyadh",
        "Kidney Care Center – Al Olaya, Riyadh",
        "King Abdullah Cancer Center – Riyadh",
        "King Abdullah Medical Complex – Riyadh",
        "King Salman Cardiovascular Center – Riyadh",
        "New Jeddah Clinic Hospital – Riyadh Branch",
        "Oncology & Blood Disorders Center – Riyadh",
        "Prince Sattam Bin Abdulaziz University Hospital – Riyadh",
        "Rehabilitation & Physical Therapy Center – Riyadh",
        "Riyadh Dental & Maxillofacial Center",
        "Riyadh Neuroscience Institute",
        "Riyadh Oncology Center",
        "Saudi Neuroscience Center – Riyadh",
        "Specialized Dental Center – Riyadh",
        "Sports Medicine & Rehabilitation Center – Riyadh"
    ].map {
        Hospital(
            name: $0,
            location: "Riyadh",
            imageName: "building.2.fill",
            phoneNumber: ""
        )
    }

    static let hospitals: [Hospital] = (primaryHospitals + supplementalHospitals).reduce(into: [Hospital]()) { result, hospital in
        if !result.contains(where: { normalizedKey(for: $0.name) == normalizedKey(for: hospital.name) }) {
            result.append(hospital)
        }
    }

    static func hospital(matching name: String) -> Hospital? {
        let cleanedName = cleaned(name)

        if let exactMatch = hospitals.first(where: { cleaned($0.name).caseInsensitiveCompare(cleanedName) == .orderedSame }) {
            return exactMatch
        }

        let targetKey = normalizedKey(for: cleanedName)

        if let aliasMatch = hospitalAliases[targetKey] {
            return hospitals.first(where: { $0.name == aliasMatch })
        }

        let rankedMatches = hospitals
            .map { hospital in
                (hospital: hospital, key: normalizedKey(for: hospital.name))
            }
            .filter { candidate in
                candidate.key == targetKey ||
                candidate.key.contains(targetKey) ||
                targetKey.contains(candidate.key)
            }
            .sorted {
                if $0.key.count == $1.key.count {
                    return $0.hospital.name < $1.hospital.name
                }
                return $0.key.count > $1.key.count
            }

        return rankedMatches.first?.hospital
    }

    static func matches(_ lhs: String, _ rhs: String) -> Bool {
        if let lhsHospital = hospital(matching: lhs), let rhsHospital = hospital(matching: rhs) {
            return lhsHospital.name == rhsHospital.name
        }

        return normalizedKey(for: lhs) == normalizedKey(for: rhs)
    }

    static func canonicalHospitalName(for name: String) -> String {
        hospital(matching: name)?.name ?? cleaned(name)
    }

    private static let hospitalAliases: [String: String] = [
        "al habib hospital": "Dr. Sulaiman Al Habib Medical Group",
        "al hammadi hospital al nuzha": "Al Hammadi Hospital – Nuzha",
        "al mouwasat hospital": "Al Mouwasat Hospital",
        "al yamama hospital": "Al Yamamah Hospital",
        "care national hospital": "Care National Hospital",
        "dallah hospital": "Dallah Hospital",
        "dar al shifa hospital": "Dar Al Shifa Hospital",
        "dr sulaiman al habib medical group": "Dr. Sulaiman Al Habib Medical Group",
        "king fahad medical city": "King Fahad Medical City",
        "king faisal specialist hospital research centre": "King Faisal Specialist Hospital & Research Centre",
        "king khalid university hospital": "King Khalid University Hospital",
        "king salman hospital": "King Salman Hospital",
        "king saud medical city": "King Saud Medical City",
        "kimshealth medical center": "KIMSHEALTH Medical Center (Jarir)",
        "national guard health affairs": "National Guard Health Affairs",
        "prince sultan military medical city": "Prince Sultan Military Medical City",
        "riyadh care hospital": "Riyadh Care Hospital",
        "saudi german hospital": "Saudi German Hospital"
    ]

    private static func cleaned(_ text: String) -> String {
        text
            .replacingOccurrences(of: "\t", with: " ")
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }

    private static func normalizedKey(for text: String) -> String {
        let cleanedText = cleaned(text)
            .lowercased()
            .replacingOccurrences(of: "–", with: "-")
            .replacingOccurrences(of: "—", with: "-")
            .replacingOccurrences(of: "&", with: " and ")
            .replacingOccurrences(of: "(riyadh branch)", with: "")
            .replacingOccurrences(of: "riyadh branch", with: "")
            .replacingOccurrences(of: ", riyadh", with: "")
            .replacingOccurrences(of: " - riyadh", with: "")
            .replacingOccurrences(of: " – riyadh", with: "")

        let allowedScalars = cleanedText.unicodeScalars.map { scalar -> Character in
            CharacterSet.alphanumerics.contains(scalar) ? Character(String(scalar)) : " "
        }

        return String(allowedScalars)
            .split(separator: " ")
            .joined(separator: " ")
    }
}
