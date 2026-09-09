import SwiftUI

private enum DoctorSortOption: String, CaseIterable, Identifiable {
    case highestRated
    case lowestRated
    case name

    var id: String { rawValue }
}

struct DoctorSearchView: View {
    @EnvironmentObject var appState: AppState
    @State private var query = ""
    @State private var sortOption: DoctorSortOption = .highestRated

    private var filtered: [Doctor] {
        let searchedDoctors = query.isEmpty ? DoctorData.doctors : DoctorData.doctors.filter {
            appState.localizedDoctorName($0.name).localizedCaseInsensitiveContains(query) ||
            $0.name.localizedCaseInsensitiveContains(query) ||
            $0.specialty.localizedCaseInsensitiveContains(query) ||
            appState.localizedHospitalName($0.hospital).localizedCaseInsensitiveContains(query) ||
            $0.hospital.localizedCaseInsensitiveContains(query)
        }

        switch sortOption {
        case .highestRated:
            return searchedDoctors.sorted {
                if $0.rating == $1.rating {
                    return $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending
                }
                return $0.rating > $1.rating
            }
        case .lowestRated:
            return searchedDoctors.sorted {
                if $0.rating == $1.rating {
                    return $0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending
                }
                return $0.rating < $1.rating
            }
        case .name:
            return searchedDoctors.sorted {
                appState.localizedDoctorName($0.name).localizedCaseInsensitiveCompare(appState.localizedDoctorName($1.name)) == .orderedAscending
            }
        }
    }

    var body: some View {
        ZStack {
            HayatBackground()
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(filtered) { doctor in
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
                                    Text(appState.localizedHospitalName(doctor.hospital.replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines)))
                                        .font(.caption)
                                        .foregroundColor(.brandBlue)
                                        .fontWeight(.medium)
                                        .multilineTextAlignment(.leading)
                                        .lineLimit(2)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .layoutPriority(1)
                                
                                Spacer()
                                
                                VStack(alignment: .trailing, spacing: 4) {
                                    HStack(spacing: 4) {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.yellow)
                                            .font(.caption)
                                        Text(String(format: "%.1f", doctor.rating))
                                            .font(.caption)
                                            .fontWeight(.bold)
                                            .foregroundColor(.primary)
                                    }
                                    Text("\(doctor.experience)+ Yrs")
                                        .font(.caption2)
                                        .foregroundColor(.gray)
                                }
                                .frame(width: 64, alignment: .trailing)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .cardStyle()
                }
            }
            .padding()
        }
        .searchable(text: $query, prompt: appState.localized("Search doctors or specialties"))
        .navigationTitle(appState.localized("Find a Doctor"))
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Menu {
                    Picker(appState.localized("Sort By"), selection: $sortOption) {
                        Text(appState.localized("Highest Rated")).tag(DoctorSortOption.highestRated)
                        Text(appState.localized("Lowest Rated")).tag(DoctorSortOption.lowestRated)
                        Text(appState.localized("Name")).tag(DoctorSortOption.name)
                    }
                } label: {
                    Label(appState.localized("Sort"), systemImage: "arrow.up.arrow.down.circle")
                }
            }
        }
    }
}
