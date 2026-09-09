import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    @State private var name = ""
    @State private var showAnimation = false

    var body: some View {
        Group {
            if appState.isLoggedIn {
                MainTabView()
                    // Ensure the view hierarchy is fully rebuilt when language changes to prevent RTL layout crashes
                    .id(appState.language)
            } else if showAnimation {
                LoginAnimationView(loggedIn: $appState.isLoggedIn, showAnimation: $showAnimation)
                    .id(appState.language)
            } else {
                LoginView(name: $name, showAnimation: $showAnimation)
                    .id(appState.language) // Rebuild login view too
            }
        }
        .environment(\.layoutDirection, appState.language == .arabic ? .rightToLeft : .leftToRight)
        .preferredColorScheme(appState.isDarkMode ? .dark : .light)
        .onChange(of: appState.isLoggedIn) { _, isLoggedIn in
            if !isLoggedIn {
                name = ""
                showAnimation = false
            }
        }
    }
}
