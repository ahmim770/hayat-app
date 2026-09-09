import Foundation

struct PharmacyData {
    static var pharmacies: [Pharmacy] {
        let now = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: now)
        
        // Open from 8 AM to 10 PM (22:00)
        let isOpen = hour >= 8 && hour < 22
        
        return [
            Pharmacy(name: "Al Nahdi Pharmacy", location: "Riyadh", isOpen: isOpen, rating: 4.8, imageName: "pills.fill"),
            Pharmacy(name: "Kunoz Pharmacy", location: "Riyadh", isOpen: isOpen, rating: 4.5, imageName: "pills.fill"),
            Pharmacy(name: "Al Dawaa Pharmacy", location: "Riyadh", isOpen: isOpen, rating: 4.2, imageName: "pills.fill"),
            Pharmacy(name: "Lemon Pharmacy", location: "Riyadh", isOpen: isOpen, rating: 4.6, imageName: "pills.fill"),
            Pharmacy(name: "Orange Pharmacy", location: "Riyadh", isOpen: isOpen, rating: 4.0, imageName: "pills.fill"),
            Pharmacy(name: "Whites Pharmacy", location: "Riyadh", isOpen: isOpen, rating: 4.7, imageName: "pills.fill"),
            Pharmacy(name: "Care Pharmacy", location: "Riyadh", isOpen: isOpen, rating: 4.3, imageName: "pills.fill"),
            Pharmacy(name: "United Pharmacies", location: "Riyadh", isOpen: isOpen, rating: 4.1, imageName: "pills.fill"),
            Pharmacy(name: "Boots Pharmacy", location: "Riyadh", isOpen: isOpen, rating: 4.4, imageName: "pills.fill"),
            Pharmacy(name: "Al Haya Pharmacy", location: "Riyadh", isOpen: isOpen, rating: 4.2, imageName: "pills.fill"),
            Pharmacy(name: "Al Teriak Pharmacy", location: "Riyadh", isOpen: isOpen, rating: 4.0, imageName: "pills.fill"),
            Pharmacy(name: "Al Amri Pharmacy", location: "Riyadh", isOpen: isOpen, rating: 3.9, imageName: "pills.fill"),
            Pharmacy(name: "Al Rashid Pharmacy", location: "Riyadh", isOpen: isOpen, rating: 4.1, imageName: "pills.fill"),
            Pharmacy(name: "Al Manar Pharmacy", location: "Riyadh", isOpen: isOpen, rating: 4.0, imageName: "pills.fill"),
            Pharmacy(name: "Al Rowad Pharmacy", location: "Riyadh", isOpen: isOpen, rating: 3.8, imageName: "pills.fill"),
            Pharmacy(name: "Al Waha Pharmacy", location: "Riyadh", isOpen: isOpen, rating: 4.1, imageName: "pills.fill"),
            Pharmacy(name: "Al Shifa Pharmacy", location: "Riyadh", isOpen: isOpen, rating: 4.3, imageName: "pills.fill")
        ]
    }
}
