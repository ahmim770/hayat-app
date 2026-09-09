import SwiftUI

struct LoginAnimationView: View {
    @Binding var loggedIn: Bool
    @Binding var showAnimation: Bool
    @State private var scale: CGFloat = 1.0

    var body: some View {
        ZStack {
            HayatBackground()

            Image(systemName: "heart.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
                .foregroundColor(.red)
                .scaleEffect(scale)
        }
        .onAppear {
            scale = 1

            withAnimation(.easeInOut(duration: 0.9)) {
                scale = 24
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                loggedIn = true
                showAnimation = false
            }
        }
    }
}

#Preview {
    LoginAnimationView(loggedIn: .constant(false), showAnimation: .constant(true))
}
