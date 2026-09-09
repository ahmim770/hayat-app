import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var appState: AppState
    
    // Removed init() to avoid repeated global appearance configuration
    
    var body: some View {
        TabView(selection: $appState.selectedTab) {
            HomeView()
                .tabItem { Label(appState.localized("Home"), systemImage: "house.fill") }
                .tag(0)
            
            NavigationStack {
                HospitalListView()
            }
            .tabItem { Label(appState.localized("Hospitals"), systemImage: "building.2.fill") }
            .tag(1)
            
            NavigationStack {
                MorafiqChatView()
            }
            .tabItem { Label(appState.localized("Morafiq"), systemImage: "waveform.circle.fill") }
            .tag(2)
            
            EmergencyView()
                .tabItem { Label(appState.localized("Emergency"), systemImage: "cross.case.fill") }
                .tag(3)

            ProfileView()
                .tabItem { Label(appState.localized("Profile"), systemImage: "person.fill") }
                .tag(4)
        }
        .accentColor(.brandBlue)
        .onAppear {
            configureTabBar()
        }
    }
    
    private func configureTabBar() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemBackground
        appearance.shadowColor = UIColor.clear // Remove top line shadow for cleaner look
        
        let itemAppearance = UITabBarItemAppearance()
        itemAppearance.normal.iconColor = UIColor.systemGray2
        itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.systemGray2]
        
        let brandColor = UIColor(red: 0.05, green: 0.3, blue: 0.6, alpha: 1.0) // Brand Blue
        
        itemAppearance.selected.iconColor = brandColor
        itemAppearance.selected.titleTextAttributes = [.foregroundColor: brandColor]
        
        appearance.stackedLayoutAppearance = itemAppearance
        appearance.inlineLayoutAppearance = itemAppearance
        appearance.compactInlineLayoutAppearance = itemAppearance
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
}
