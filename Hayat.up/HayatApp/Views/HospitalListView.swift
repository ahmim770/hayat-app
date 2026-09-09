import SwiftUI

struct HospitalListView: View {
    @EnvironmentObject var appState: AppState
    @State private var searchText = ""
    let hospitals = HospitalData.hospitals
    
    var filteredHospitals: [Hospital] {
        if searchText.isEmpty {
            return hospitals
        } else {
            return hospitals.filter {
                $0.name.localizedCaseInsensitiveContains(searchText) ||
                appState.localizedHospitalName($0.name).localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        ZStack {
            HayatBackground()
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(filteredHospitals) { hospital in
                        NavigationLink(destination: HospitalDetailView(hospital: hospital)) {
                            HStack(spacing: 16) {
                                Image(systemName: hospital.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 30) // Adjusted to fit inside 60x60 circle
                                    .foregroundColor(.brandBlue)
                                    .frame(width: 60, height: 60)
                                    .background(Circle().fill(Color.gray.opacity(0.1))) // Match Doctor UI gray background
                                    .clipShape(Circle())
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(appState.localizedHospitalName(hospital.name.replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines)))
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                        .multilineTextAlignment(.leading)
                                        .lineLimit(2)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Text(appState.localized(hospital.location.replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines)))
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                        .multilineTextAlignment(.leading)
                                        .lineLimit(2)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .layoutPriority(1)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .cardStyle() // Consistent card styling with DoctorSearchView
                    }
                }
                .padding()
            }
        }
        .searchable(text: $searchText, prompt: appState.localized("Search hospitals"))
        .navigationTitle(appState.localized("Hospitals"))
    }
}
