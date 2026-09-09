import SwiftUI

struct HospitalDetailView: View {
    let hospital: Hospital
    @EnvironmentObject var appState: AppState
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @State private var showingDirectionsOptions = false
    
    // Filter doctors for this hospital
    var hospitalDoctors: [Doctor] {
        DoctorData.doctors(for: hospital)
    }
    
    // Group doctors by specialty
    var groupedDoctors: [String: [Doctor]] {
        Dictionary(grouping: hospitalDoctors, by: { $0.specialty })
    }
    
    var body: some View {
        ZStack {
            HayatBackground()
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    // Header Image
                    Image(systemName: hospital.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.brandBlue)
                        .padding()
                        .background(Color.brandBlue.opacity(0.1))
                    
                    VStack(alignment: .leading, spacing: 24) {
                        // Info
                        VStack(alignment: .leading, spacing: 8) {
                            Text(appState.localizedHospitalName(hospital.name.replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines)))
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            HStack {
                                Image(systemName: "mappin.and.ellipse")
                                    .foregroundColor(.gray)
                                Text(hospital.location.replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines))
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        HStack(spacing: 12) {
                            Button {
                                // Call Hospital Logic
                                let cleanedPhone = hospital.phoneNumber.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
                                if let url = URL(string: "tel://\(cleanedPhone)") {
                                    UIApplication.shared.open(url)
                                }
                            } label: {
                                Label(appState.localized("Call Hospital"), systemImage: "phone.fill")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.green)
                                    .cornerRadius(12)
                            }
                            
                            Button {
                                showingDirectionsOptions = true
                            } label: {
                                Label(appState.localized("Get directions"), systemImage: "map.fill")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue)
                                    .cornerRadius(12)
                            }
                            .confirmationDialog(
                                appState.localized("Get directions"),
                                isPresented: Binding(
                                    get: { isCompactLayout && showingDirectionsOptions },
                                    set: { if !$0 { showingDirectionsOptions = false } }
                                ),
                                titleVisibility: .visible
                            ) {
                                Button(appState.localized("Open in Apple Maps")) {
                                    openAppleMaps()
                                }
                                Button(appState.localized("Open in Google Maps")) {
                                    openGoogleMaps()
                                }
                                Button(appState.localized("Cancel"), role: .cancel) { }
                            }
                            .popover(
                                isPresented: Binding(
                                    get: { !isCompactLayout && showingDirectionsOptions },
                                    set: { if !$0 { showingDirectionsOptions = false } }
                                ),
                                attachmentAnchor: .rect(.bounds),
                                arrowEdge: .bottom
                            ) {
                                VStack(alignment: .leading, spacing: 8) {
                                    Button(appState.localized("Open in Apple Maps")) {
                                        showingDirectionsOptions = false
                                        openAppleMaps()
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)

                                    Button(appState.localized("Open in Google Maps")) {
                                        showingDirectionsOptions = false
                                        openGoogleMaps()
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .padding()
                                .frame(minWidth: 240)
                            }
                        }
                        .padding(.bottom, 16)
                        
                        Divider()
                        
                        // Doctors List
                        VStack(alignment: .leading, spacing: 16) {
                            Text(appState.localized("Available Doctors"))
                                .font(.title3)
                                .fontWeight(.bold)
                            
                            if hospitalDoctors.isEmpty {
                                Text(appState.localized("No doctors listed for this hospital yet."))
                                    .foregroundColor(.secondary)
                                    .padding()
                            } else {
                                // Sort specialties alphabetically
                                ForEach(groupedDoctors.keys.sorted(), id: \.self) { specialty in
                                    VStack(alignment: .leading, spacing: 12) {
                                        Text(specialty.replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines))
                                            .font(.headline)
                                            .foregroundColor(.brandBlue)
                                            .padding(.horizontal, 4)
                                            .padding(.top, 8)
                                        
                                        
                                        ForEach(groupedDoctors[specialty] ?? []) { doctor in
                                            NavigationLink {
                                                DoctorProfileView(doctor: doctor)
                                            } label: {
                                                HStack(spacing: 16) {
                                                    Image(systemName: doctor.imageName)
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                        .frame(width: 60, height: 60)
                                                        .clipShape(Circle())
                                                        .background(Circle().fill(Color.gray.opacity(0.1)))
                                                    
                                                    VStack(alignment: .leading, spacing: 4) {
                                                        Text(appState.localizedDoctorName(doctor.name.replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines)))
                                                            .font(.headline)
                                                            .foregroundColor(.primary)
                                                            .multilineTextAlignment(.leading)
                                                            .lineLimit(2)
                                                            .frame(maxWidth: .infinity, alignment: .leading)
                                                        Text(doctor.specialty.replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines))
                                                            .font(.subheadline)
                                                            .foregroundColor(.secondary)
                                                            .multilineTextAlignment(.leading)
                                                            .lineLimit(2)
                                                            .frame(maxWidth: .infinity, alignment: .leading)
                                                        
                                                        HStack(spacing: 4) {
                                                            Image(systemName: "star.fill")
                                                                .foregroundColor(.yellow)
                                                                .font(.caption)
                                                            Text(String(format: "%.1f", Double(doctor.rating)))
                                                                .font(.caption)
                                                                .foregroundColor(.secondary)
                                                        }
                                                    }
                                                    .layoutPriority(1)
                                                    
                                                    Spacer()
                                                    
                                                    Image(systemName: "chevron.right")
                                                        .foregroundColor(.gray)
                                                }
                                                .padding()
                                                .background(Color(uiColor: .secondarySystemGroupedBackground))
                                                .cornerRadius(12)
                                                .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle(appState.localized("Hospital Details"))
        .navigationBarTitleDisplayMode(.inline)
    }

    private var isCompactLayout: Bool {
        horizontalSizeClass == .compact || UIDevice.current.userInterfaceIdiom == .phone
    }

    private func openAppleMaps() {
        var components = URLComponents(string: "http://maps.apple.com/")
        components?.queryItems = [
            URLQueryItem(name: "q", value: hospital.name + " " + hospital.location)
        ]

        if let url = components?.url {
            UIApplication.shared.open(url)
        }
    }

    private func openGoogleMaps() {
        var components = URLComponents(string: "https://www.google.com/maps/search/")
        components?.queryItems = [
            URLQueryItem(name: "api", value: "1"),
            URLQueryItem(name: "query", value: hospital.name + " " + hospital.location)
        ]

        if let url = components?.url {
            UIApplication.shared.open(url)
        }
    }
}
