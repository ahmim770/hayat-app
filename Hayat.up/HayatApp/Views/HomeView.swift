import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appState: AppState
    @State private var showSearch = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                HayatBackground()
                
                ScrollView {
                    VStack(spacing: 32) {
                        HomeHeaderView()
                        
                        // 1. Morafiq
                        NavigationLink {
                            MorafiqChatView()
                        } label: {
                            HStack(spacing: 16) {
                                Image(systemName: "waveform.circle.fill")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.white)
                                    .padding(8)
                                    .background(Color.white.opacity(0.2))
                                    .clipShape(Circle())
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(appState.localized("Morafiq – Medical Assistant").trimmingCharacters(in: .whitespacesAndNewlines))
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text(appState.localized("Ask about symptoms, hospitals, doctors.").trimmingCharacters(in: .whitespacesAndNewlines))
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.9))
                                        .multilineTextAlignment(.leading)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white.opacity(0.8))
                            }
                            .padding(20)
                            .background(
                                LinearGradient(
                                    colors: [Color.brandBlue, Color.brandTeal],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .cornerRadius(20)
                            .shadow(color: Color.brandBlue.opacity(0.3), radius: 10, x: 0, y: 5)
                        }
                        .padding(.horizontal)
                        
                        // 2. Search Bar
                        Button {
                            showSearch = true
                        } label: {
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.brandBlue)
                                Text(appState.localized("Search for doctor, specialty..."))
                                    .foregroundColor(.secondary)
                                Spacer()
                            }
                            .padding(.horizontal, 20)
                            .frame(height: 56)
                            .background(Color(uiColor: .secondarySystemGroupedBackground))
                            .cornerRadius(16)
                            .shadow(color: .black.opacity(0.03), radius: 10, x: 0, y: 5)
                        }
                        .padding(.horizontal)
                        
                        // 3. Defined Care
                        VStack(alignment: .leading, spacing: 20) {
                            Text(appState.localized("Defined Care"))
                                .font(.title3)
                                .fontWeight(.bold)
                                .padding(.horizontal)
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                                NavigationLink {
                                    HospitalListView()
                                } label: {
                                    QuickActionCard(title: appState.localized("Hospitals"), icon: "building.2.fill", color: .blue)
                                }
                                
                                NavigationLink {
                                    PharmacyListView()
                                } label: {
                                    QuickActionCard(title: appState.localized("Pharmacy"), icon: "pills.fill", color: .green)
                                }
                                
                                NavigationLink {
                                    DoctorSearchView()
                                } label: {
                                    QuickActionCard(title: appState.localized("Doctors"), icon: "stethoscope", color: .orange)
                                }
                                
                                NavigationLink {
                                    EmergencyView()
                                } label: {
                                    QuickActionCard(title: appState.localized("Emergency"), icon: "phone.fill", color: .red)
                                }
                                
                                NavigationLink {
                                    MedicationsView()
                                } label: {
                                    QuickActionCard(title: appState.localized("Medications"), icon: "pills.circle.fill", color: .purple)
                                }
                                
                                NavigationLink {
                                    AllergiesView()
                                } label: {
                                    QuickActionCard(title: appState.localized("Allergies"), icon: "exclamationmark.triangle.fill", color: .yellow)
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        Spacer()
                            .frame(height: 40)
                    }
                    .padding(.vertical, 20)
                }
            }
            .navigationDestination(isPresented: $showSearch) {
                DoctorSearchView()
            }
        }
    }
}

// MARK: - Components

struct HomeHeaderView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 4) {
                Text(appState.localized("Welcome back,"))
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(appState.username.isEmpty ? "Guest" : appState.username)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            
            Spacer()
            
            // Weather Card 
            HStack(spacing: 8) {
                VStack(alignment: .trailing, spacing: 0) {
                    Text(appState.temperature)
                        .font(.headline)
                        .foregroundColor(.primary)
                }
                Image(systemName: "sun.max.fill")
                    .foregroundColor(.orange)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Color(uiColor: .secondarySystemGroupedBackground))
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.03), radius: 5, x: 0, y: 2)
        }
        .padding(.horizontal)
    }
}

struct QuickActionCard: View {
    let title: String
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(color)
                .frame(width: 56, height: 56)
                .background(color.opacity(0.1))
                .clipShape(Circle())
            
            Text(title)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(.primary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 24)
        .background(Color(uiColor: .secondarySystemGroupedBackground))
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.03), radius: 10, x: 0, y: 5)
    }
}
