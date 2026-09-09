import SwiftUI

struct EmergencyView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        ZStack {
            HayatBackground()
            
            ScrollView {
                    VStack(spacing: 32) {
                        
                        // Header Text
                        VStack(spacing: 8) {
                            Text(appState.localized("In case of emergency"))
                                .font(.title3)
                                .foregroundColor(.secondary)
                            Text(appState.localized("Help is one tap away"))
                                .font(.headline)
                                .foregroundColor(.primary)
                        }
                        .padding(.top)
                        
                        // Swipe to Call 911 Slider
                        SwipeToCallButton()
                            .padding(.horizontal, 24)
                            .padding(.vertical, 20)
                        
                        // Secondary Services
                        VStack(alignment: .leading, spacing: 16) {
                            Text(appState.localized("Other Services"))
                                .font(.title3)
                                .fontWeight(.bold)
                                .padding(.horizontal)
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                                EmergencyCard(name: appState.localized("Saudi Red Crescent"), number: "997", icon: "cross.case.fill", color: .red)
                                EmergencyCard(name: appState.localized("MoH Health"), number: "937", icon: "cross.fill", color: .purple)
                                EmergencyCard(name: appState.localized("Police"), number: "999", icon: "shield.fill", color: .blue)
                                EmergencyCard(name: appState.localized("Civil Defense"), number: "998", icon: "flame.fill", color: .orange)
                            }
                            .padding(.horizontal)
                        }
                        
                        Spacer()
                            .frame(height: 50)
                    }
                    .padding(.bottom)
                }
            }
            .navigationTitle(appState.localized("Emergency"))
    }
}

struct SwipeToCallButton: View {
    @EnvironmentObject var appState: AppState
    @State private var offset: CGFloat = 0
    @State private var isDragging = false
    @State private var didCall = false
    
    // Constants
    private let buttonHeight: CGFloat = 80
    private let knobSize: CGFloat = 70
    private let padding: CGFloat = 5
    
    var body: some View {
        GeometryReader { geometry in
            let trackWidth = geometry.size.width
            let dragLimit = trackWidth - knobSize - (padding * 2)
            
            ZStack(alignment: .leading) {
                // Track Background
                RoundedRectangle(cornerRadius: buttonHeight / 2)
                    .fill(Color.red.opacity(0.15))
                
                // Text
                Text(slideText)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity)
                    .opacity(offset > 50 ? 0.5 : 1) // Fade out text as we slide
                
                HStack {
                    ZStack {
                        Circle()
                            .fill(Color.red)
                            .shadow(color: .red.opacity(0.4), radius: 5, x: 0, y: 3)
                        
                        Image(systemName: "phone.fill")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    .frame(width: knobSize, height: knobSize)
                    .offset(x: offset)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                if !didCall {
                                    
                                    let newOffset = value.translation.width
                                    if newOffset >= 0 && newOffset <= dragLimit {
                                        offset = newOffset
                                        isDragging = true
                                    }
                                }
                            }
                            .onEnded { value in
                                if offset >= dragLimit * 0.85 {
                                    // Success Threshold Reached
                                    withAnimation {
                                        offset = dragLimit
                                        didCall = true
                                        callEmergency()
                                    }
                                    
                                    // Reset after delay
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        withAnimation {
                                            offset = 0
                                            didCall = false
                                        }
                                    }
                                } else {
                                    // Snap back
                                    withAnimation(.spring()) {
                                        offset = 0
                                        isDragging = false
                                    }
                                }
                            }
                    )
                    
                    Spacer()
                }
                .padding(padding)
            }
            
            .environment(\.layoutDirection, .leftToRight)
        }
        .frame(height: buttonHeight)
    }
    
    var slideText: String {
        if didCall {
            return appState.localized("🚑🚑🚑🚑🚑🚑")
        }
        
        if offset > 200 {
             return appState.localized("Help is on the way")
        } else if offset > 100 {
             return appState.localized("Connecting to emergency services")
        } else if offset > 20 {
             return appState.localized("Not too far to arrive")
        } else {
             return appState.localized("Swipe to Call 911")
        }
    }
    
    func callEmergency() {
        if let url = URL(string: "tel://911") {
            UIApplication.shared.open(url)
        }
    }
}

struct EmergencyCard: View {
    let name: String
    let number: String
    let icon: String
    let color: Color
    
    var body: some View {
        Button {
            if let url = URL(string: "tel://\(number)") {
                UIApplication.shared.open(url)
            }
        } label: {
            VStack(spacing: 12) {
                Image(systemName: icon)
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background(color)
                    .clipShape(Circle())
                
                Text(name)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.primary)
                    .lineLimit(1) // Ensure uniform height
                    .minimumScaleFactor(0.8)
                
                Text(number)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(color)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 160) // Fixed height for uniformity
            .padding()
            .background(Color(uiColor: .secondarySystemGroupedBackground))
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
        }
    }
}
