import SwiftUI

struct PharmacyListView: View {
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
        ZStack {
            HayatBackground()
            VStack(spacing: 0) {
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(appState.pharmacies) { pharmacy in
                            NavigationLink {
                                PharmacyDetailView(pharmacy: pharmacy)
                            } label: {
                                PharmacyCard(pharmacy: pharmacy)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle(appState.localized("Pharmacy"))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PharmacyDetailView: View {
    let pharmacy: Pharmacy
    @EnvironmentObject var appState: AppState
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @State private var showingDirectionsOptions = false
    
    var body: some View {
        ZStack {
            HayatBackground()
            VStack(spacing: 24) {
                VStack(spacing: 16) {
                    Image(systemName: pharmacy.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                        .foregroundColor(.brandTeal)
                        .padding()
                        .background(Color.brandTeal.opacity(0.1))
                        .cornerRadius(20)
                    
                    Text(appState.localizedPharmacyName(pharmacy.name))
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text(appState.localized(pharmacy.location))
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    if pharmacy.isOpen {
                        Text("Open")
                            .font(.headline)
                            .foregroundColor(.green)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 6)
                            .background(Color.green.opacity(0.1))
                            .cornerRadius(8)
                    } else {
                        Text("Closed")
                            .font(.headline)
                            .foregroundColor(.red)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 6)
                            .background(Color.red.opacity(0.1))
                            .cornerRadius(8)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(uiColor: .secondarySystemGroupedBackground))
                .cornerRadius(16)
                .padding(.horizontal)
                
                Button {
                    showingDirectionsOptions = true
                } label: {
                    HStack {
                        Image(systemName: "map.fill")
                        Text(appState.localized("Get directions"))
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
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
                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.top)
        }
        .navigationTitle(appState.localizedPharmacyName(pharmacy.name))
    }

    private var isCompactLayout: Bool {
        horizontalSizeClass == .compact || UIDevice.current.userInterfaceIdiom == .phone
    }

    private func openAppleMaps() {
        var components = URLComponents(string: "http://maps.apple.com/")
        components?.queryItems = [
            URLQueryItem(name: "q", value: pharmacy.name + " " + pharmacy.location)
        ]

        if let url = components?.url {
            UIApplication.shared.open(url)
        }
    }

    private func openGoogleMaps() {
        var components = URLComponents(string: "https://www.google.com/maps/search/")
        components?.queryItems = [
            URLQueryItem(name: "api", value: "1"),
            URLQueryItem(name: "query", value: pharmacy.name + " " + pharmacy.location)
        ]

        if let url = components?.url {
            UIApplication.shared.open(url)
        }
    }
}

struct PharmacyCard: View {
    let pharmacy: Pharmacy
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: pharmacy.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .foregroundColor(.brandTeal)
                .padding()
                .background(Color.brandTeal.opacity(0.1))
                .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(appState.localizedPharmacyName(pharmacy.name))
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(appState.localized(pharmacy.location))
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                HStack {
                    if pharmacy.isOpen {
                        Text("Open")
                            .font(.caption)
                            .foregroundColor(.green)
                            .fontWeight(.bold)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 2)
                            .background(Color.green.opacity(0.1))
                            .cornerRadius(4)
                    } else {
                        Text("Closed")
                            .font(.caption)
                            .foregroundColor(.red)
                            .fontWeight(.bold)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 2)
                            .background(Color.red.opacity(0.1))
                            .cornerRadius(4)
                    }
                }
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
        }
        .padding()
        .cardStyle()
    }
}
