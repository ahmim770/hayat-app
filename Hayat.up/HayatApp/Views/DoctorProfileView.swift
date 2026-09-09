import SwiftUI

struct DoctorProfileView: View {
    let doctor: Doctor
    @EnvironmentObject var appState: AppState
    
    @State private var showCallError = false
    @State private var callErrorMessage = ""

    var body: some View {
        ZStack {
            HayatBackground()
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Header
                    HStack(alignment: .top, spacing: 20) {
                        Image(systemName: doctor.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .padding()
                            .background(Color.brandTeal.opacity(0.1))
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text(appState.localizedDoctorName(doctor.name))
                                .font(.title2)
                                .fontWeight(.bold)
                            
                            Text(doctor.specialty)
                                .font(.headline)
                                .foregroundColor(.gray)
                            
                            Text(appState.localizedHospitalName(doctor.hospital))
                                .font(.subheadline)
                                .foregroundColor(.brandBlue)
                            
                            HStack {
                                ForEach(0..<Int(doctor.rating), id: \.self) { _ in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                }
                            }
                        }
                    }
                    .padding()
                    
                    Divider()
                    
                    // About
                    VStack(alignment: .leading, spacing: 12) {
                        Text(appState.localized("About"))
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Text(appState.localizedDoctorIntro(for: doctor))
                            .foregroundColor(.secondary)
                            .lineSpacing(4)
                    }
                    .padding(.horizontal)
                    
                    // Stats
                    HStack(spacing: 40) {
                        StatView(value: "\(doctor.experience)+", label: appState.localized("Years"))
                        StatView(value: "\(doctor.patientsServed)+", label: appState.localized("Patients"))
                        StatView(value: String(format: "%.1f", Double(doctor.rating)), label: appState.localized("Rating"))
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.05))
                    .cornerRadius(16)
                    .padding(.horizontal)
                    
                    // Education & Languages
                    VStack(alignment: .leading, spacing: 16) {
                        HStack(alignment: .top) {
                            Image(systemName: "graduationcap.fill")
                                .foregroundColor(.gray)
                            VStack(alignment: .leading) {
                                Text(appState.localized("Education"))
                                    .font(.headline)
                                Text(doctor.education)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                        HStack(alignment: .top) {
                            Image(systemName: "globe")
                                .foregroundColor(.gray)
                            VStack(alignment: .leading) {
                                Text(appState.localized("Languages"))
                                    .font(.headline)
                                Text(doctor.languages.joined(separator: ", "))
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                        .frame(height: 100)
                }
            }
        }
        .safeAreaInset(edge: .bottom) {
            HStack(spacing: 16) {
                Button {
                    if let hospital = HospitalData.hospital(matching: doctor.hospital) {
                        let cleanedPhone = hospital.phoneNumber.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
                        
                        if let url = URL(string: "tel:\(cleanedPhone)"), !cleanedPhone.isEmpty {
                            if UIApplication.shared.canOpenURL(url) {
                                UIApplication.shared.open(url)
                            } else {
                                // Fallback for Simulator or devices without phone capability
                                callErrorMessage = "Cannot make calls on this device.\nNumber: \(hospital.phoneNumber)"
                                showCallError = true
                            }
                        } else {
                            callErrorMessage = "Invalid phone number format."
                            showCallError = true
                        }
                    } else {
                        callErrorMessage = "Hospital phone number not found."
                        showCallError = true
                    }
                } label: {
                    Label(appState.localized("Call Hospital"), systemImage: "phone.fill")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.brandBlue)
                        .foregroundColor(.white)
                        .cornerRadius(16)
                        .shadow(color: .brandBlue.opacity(0.3), radius: 5, x: 0, y: 3)
                }
            }
            .padding()
            .background(Color(uiColor: .systemBackground).ignoresSafeArea())
            .shadow(color: Color.primary.opacity(0.05), radius: 10, x: 0, y: -5)
        }
        .alert("Call Failed", isPresented: $showCallError) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(callErrorMessage)
        }
    }
}

struct StatView: View {
    let value: String
    let label: String
    
    var body: some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.brandTeal)
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}
