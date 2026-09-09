import SwiftUI

struct LoginView: View {
    @Binding var name: String
    @Binding var showAnimation: Bool
    @EnvironmentObject var appState: AppState
    @State private var isPulsing = false
    
    var body: some View {
        ZStack {
            HayatBackground()
            
            VStack(spacing: 40) {
                // Language Selector 
                HStack {
                    Spacer()
                    Button {
                        appState.language = (appState.language == .english) ? .arabic : .english
                    } label: {
                        Text(appState.language == .english ? "العربية" : "English")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.brandBlue)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.brandBlue.opacity(0.1))
                            .clipShape(Capsule())
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                // Logo Section
                VStack(spacing: 16) {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 72, height: 72)
                        .foregroundColor(.red)
                        .scaleEffect(isPulsing ? 1.08 : 0.94)
                        .animation(.easeInOut(duration: 1.6).repeatForever(autoreverses: true), value: isPulsing)
                    
                    Text("Hayat")
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                        .foregroundColor(.brandBlue)
                }
                
                // Input Section
                VStack(spacing: 20) {
                    TextField(appState.localized("Enter your name"), text: $name)
                        .padding()
                        .background(Color.cardBackground)
                        .cornerRadius(12)
                        .foregroundColor(.primary)
                        .padding(.horizontal)
                    
                    Button {
                        if !name.isEmpty {
                            appState.username = name
                            showAnimation = true
                        }
                    } label: {
                        Text(appState.localized("Continue"))
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.brandBlue)
                            .cornerRadius(12)
                    }
                    .padding(.horizontal)
                    .disabled(name.isEmpty)
                    .opacity(name.isEmpty ? 0.6 : 1.0)
                    
                    Button {
                        name = "Nafath User"
                        appState.username = name
                        showAnimation = true
                    } label: {
                        HStack {
                            Image(systemName: "person.crop.circle.badge.checkmark")
                            Text(appState.localized("Login with Nafath"))
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 0.0, green: 0.45, blue: 0.25))
                        .cornerRadius(12)
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
                
               
            }
        }
        .onAppear {
            isPulsing = true
        }
    }
}
