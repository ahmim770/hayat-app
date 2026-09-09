import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var appState: AppState
    @State private var showingLogoutAlert = false

    var body: some View {
        NavigationStack {
            List {
                // 1. Profile Header
                Section {
                    HStack(spacing: 16) {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.brandBlue)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(appState.username)
                                .font(.headline)
                            Text(appState.localized("Riyadh, Saudi Arabia"))
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 8)
                }
                
                // 2. Insurance Card
                Section {
                    InsuranceCardSmall()
                }
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.clear)
                
                Section(appState.localized("Settings")) {
                    NavigationLink {
                        InsuranceSettingsView()
                    } label: {
                        Label(appState.localized("Insurance Settings"), systemImage: "creditcard.fill")
                    }
                    
                    Picker(selection: $appState.language, label: Label(appState.localized("Language"), systemImage: "globe")) {
                        Text("English 🇺🇸").tag(AppLanguage.english)
                        Text("العربية 🇸🇦").tag(AppLanguage.arabic)
                    }
                    
                    Picker(selection: $appState.appAppearance, label: Label(appState.localized("App Appearance"), systemImage: "paintpalette.fill")) {
                        Text(appState.localized("Follow System")).tag(AppAppearance.system)
                        Text(appState.localized("Light")).tag(AppAppearance.light)
                        Text(appState.localized("Dark")).tag(AppAppearance.dark)
                    }
                }
                
                // 5. Support & About
                Section(appState.localized("General")) {
                    NavigationLink {
                        PrivacyPolicyView()
                    } label: {
                        Label(appState.localized("Privacy Policy"), systemImage: "hand.raised.fill")
                    }

                    NavigationLink {
                        HelpView()
                    } label: {
                        Label(appState.localized("Help & Support"), systemImage: "questionmark.circle.fill")
                    }
                }
                
                // 6. Logout
                Section {
                    Button(role: .destructive) {
                        showingLogoutAlert = true
                    } label: {
                        HStack {
                            Spacer()
                            Text(appState.localized("Log Out"))
                                .fontWeight(.bold)
                            Spacer()
                        }
                    }
                }
                
                // 7. Footer
                Section {
                    VStack(spacing: 8) {
                        Text("\(appState.localized("App Version")) 2.15")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .listRowBackground(Color.clear)
                }
            }
            .scrollContentBackground(.hidden)
            .background(HayatBackground())
            .navigationTitle(appState.localized("Profile"))
            .alert(appState.localized("Logout Confirmation"), isPresented: $showingLogoutAlert) {
                Button(appState.localized("Cancel"), role: .cancel) { }
                Button(appState.localized("Log Out"), role: .destructive) {
                    appState.logout()
                }
            } message: {
                Text(appState.localized("Are you sure you want to log out? This will clear all local data on this device."))
            }
        }
    }
}

struct InsuranceCardSmall: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        if let insurance = appState.insurance {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text(insurance.provider)
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "checkmark.shield.fill")
                        .foregroundColor(.white.opacity(0.8))
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(appState.localized("Member ID"))
                            .font(.caption2)
                            .foregroundColor(.white.opacity(0.7))
                        Text(insurance.memberId)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text(appState.localized("Expires"))
                            .font(.caption2)
                            .foregroundColor(.white.opacity(0.7))
                        Text(insurance.expiryDate.formatted(date: .numeric, time: .omitted))
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(20)
            .background(LinearGradient(colors: [Color.brandBlue, Color.brandTeal], startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(16)
            .shadow(color: Color.brandBlue.opacity(0.2), radius: 8, x: 0, y: 4)
            .padding(.horizontal)
        } else {
            EmptyView()
        }
    }
}
