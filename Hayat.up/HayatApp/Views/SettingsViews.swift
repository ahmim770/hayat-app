import SwiftUI

struct InsuranceSettingsView: View {
    @EnvironmentObject var appState: AppState
    @State private var insuranceId: String = ""
    @State private var errorMessage: String?
    
    var body: some View {
        Form {
            Section(header: Text(appState.localized("Insurance Information"))) {
                if let insurance = appState.insurance {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text(appState.localized("Provider"))
                            Spacer()
                            Text(insurance.provider)
                                .foregroundColor(.secondary)
                        }
                        
                        HStack {
                            Text(appState.localized("Membership"))
                            Spacer()
                            Text(insurance.coverageType)
                                .fontWeight(.bold)
                                .foregroundColor(membershipColor(insurance.coverageType))
                        }
                        
                        HStack {
                            Text(appState.localized("Member ID"))
                            Spacer()
                            Text(insurance.memberId)
                                .foregroundColor(.secondary)
                        }
                        
                        HStack {
                            Text(appState.localized("Expires"))
                            Spacer()
                            Text(insurance.expiryDate.formatted(date: .numeric, time: .omitted))
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    Button(role: .destructive) {
                        appState.insurance = nil
                        insuranceId = ""
                    } label: {
                        Text(appState.localized("Remove Insurance"))
                    }
                } else {
                    TextField(appState.localized("Enter 9-digit Insurance ID"), text: $insuranceId)
                        .keyboardType(.numberPad)
                        .onChange(of: insuranceId) { newValue in
                            if newValue.count > 9 {
                                insuranceId = String(newValue.prefix(9))
                            }
                        }
                    
                    Button {
                        validateAndSave()
                    } label: {
                        Text(appState.localized("Save Insurance"))
                    }
                    .disabled(insuranceId.count != 9)
                    
                    if let error = errorMessage {
                        Text(error)
                            .font(.caption)
                            .foregroundColor(.red)
                    }
                }
            }
            
            Section(footer: Text(appState.localized("Membership tier determines your appointment discounts."))) {
                EmptyView()
            }
        }
        .navigationTitle(appState.localized("Insurance Settings"))
    }
    
    private func validateAndSave() {
        guard insuranceId.count == 9 else {
            errorMessage = appState.localized("ID must be exactly 9 digits")
            return
        }
        
        // Randomly assign membership tier
        let tiers = ["Platinum", "Gold", "Silver"]
        let randomTier = tiers.randomElement() ?? "Silver"
        
        let newInsurance = Insurance(
            provider: "Tawuniya",
            policyNumber: "POL-\(Int.random(in: 10000...99999))",
            memberId: insuranceId,
            expiryDate: Date().addingTimeInterval(86400 * 365), // 1 year from now
            coverageType: randomTier
        )
        
        appState.insurance = newInsurance
        errorMessage = nil
    }
    
    private func membershipColor(_ type: String) -> Color {
        switch type {
        case "Platinum": return .black
        case "Gold": return .yellow
        case "Silver": return .gray
        default: return .primary
        }
    }
}

struct HelpView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "questionmark.circle.fill")
                .font(.system(size: 60))
                .foregroundColor(.brandBlue)
            
            Text("How can we help you?")
                .font(.title2)
            
            Button {
                let phoneNumber = "+966594409974"
                let urlString = "https://wa.me/\(phoneNumber)"
                if let url = URL(string: urlString) {
                    UIApplication.shared.open(url)
                }
            } label: {
                Label(appState.localized("Contact Support"), systemImage: "message.fill")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal)
        }
        .navigationTitle(appState.localized("Help & Support"))
    }
}

struct PrivacyPolicyView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(appState.localized("Privacy Policy"))
                    .font(.title2)
                    .fontWeight(.bold)

                Text(appState.localized("Hayat protects your privacy and uses your information only to provide and improve healthcare features inside the app."))
                    .foregroundColor(.secondary)

                VStack(alignment: .leading, spacing: 10) {
                    Text(appState.localized("Morafiq AI Disclosure"))
                        .font(.headline)
                    Text(appState.localized("Messages you type in Morafiq are processed by a third-party AI service (OpenAI). Do not share sensitive personal or medical information."))
                        .foregroundColor(.secondary)
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text(appState.localized("Data We Use"))
                        .font(.headline)
                    Text(appState.localized("The app collects user-provided text input entered into the Morafiq chat. This data is transmitted securely to a third-party AI provider (OpenAI) to generate responses and is not stored by the app."))
                        .foregroundColor(.secondary)
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text(appState.localized("Your Choices"))
                        .font(.headline)
                    Text(appState.localized("You can stop using Morafiq at any time, avoid sharing sensitive information, and review this privacy notice from your profile whenever needed."))
                        .foregroundColor(.secondary)
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text(appState.localized("Morafiq Notice"))
                        .font(.headline)
                    Text(appState.localized("Messages you type in Morafiq (including any text you enter) will be transmitted to a third-party AI service (OpenAI) to generate responses.\n\nDo not share sensitive or medical data.\n\nDo you agree to continue?"))
                        .foregroundColor(.secondary)
                }
            }
            .padding()
        }
        .background(HayatBackground())
        .navigationTitle(appState.localized("Privacy Policy"))
        .navigationBarTitleDisplayMode(.inline)
    }
}
