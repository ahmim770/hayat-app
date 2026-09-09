import SwiftUI

extension Color {
    static let brandTeal = Color(red: 0.0, green: 0.65, blue: 0.6)
    static let brandBlue = Color(red: 0.05, green: 0.3, blue: 0.6)
    
    static let background = Color(uiColor: .systemGroupedBackground)
    static let cardBackground = Color(uiColor: .secondarySystemGroupedBackground)
    static let textPrimary = Color.primary
}

struct HayatBackground: View {
    @State private var animate = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            // Base background color that adapts to theme
            (colorScheme == .dark ? Color(white: 0.05) : Color(white: 0.98))
                .ignoresSafeArea()
            
            // Subtle tinted base
            Color.brandBlue.opacity(colorScheme == .dark ? 0.08 : 0.04)
                .ignoresSafeArea()
            
            GeometryReader { proxy in
                ZStack {
                    // Blue Orb
                    Circle()
                        .fill(Color.brandBlue.opacity(colorScheme == .dark ? 0.15 : 0.12))
                        .frame(width: max(proxy.size.width * 0.8, 0))
                        .blur(radius: 60)
                        .offset(x: animate ? -50 : 50, y: animate ? -50 : 50)
                    
                    // Red/Pink Orb
                    Circle()
                        .fill(Color.red.opacity(colorScheme == .dark ? 0.12 : 0.08))
                        .frame(width: max(proxy.size.width * 0.9, 0))
                        .blur(radius: 70)
                        .offset(x: animate ? 50 : -50, y: animate ? 50 : -50)
                        
                    // Teal Orb
                    Circle()
                        .fill(Color.brandTeal.opacity(colorScheme == .dark ? 0.12 : 0.08))
                        .frame(width: max(proxy.size.width * 0.6, 0))
                        .blur(radius: 50)
                        .offset(y: animate ? 100 : -100)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .ignoresSafeArea()
            .onAppear {
                withAnimation(.easeInOut(duration: 6.0).repeatForever(autoreverses: true)) {
                    animate.toggle()
                }
            }
            .environment(\.layoutDirection, .leftToRight) 
        }
    }
}

struct CardStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.cardBackground)
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}

extension View {
    func cardStyle() -> some View {
        self.modifier(CardStyle())
    }
}
