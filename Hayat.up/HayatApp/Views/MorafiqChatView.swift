import SwiftUI
import UIKit

private enum MorafiqAlert: String, Identifiable {
    case consent
    case leave

    var id: String { rawValue }
}

struct MorafiqChatView: View {
    @EnvironmentObject var appState: AppState
    @Environment(\.dismiss) var dismiss
    @AppStorage("morafiqConsentAccepted") private var hasMorafiqConsent = false
    @State private var messages: [ChatMessage] = []
    @State private var inputMessage = ""
    @State private var isLoading = false
    @State private var scrollViewProxy: ScrollViewProxy?
    @State private var activeAlert: MorafiqAlert?
    @State private var chatSessionId = ""
    
    var body: some View {
        ZStack {
            HayatBackground()
                .onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
            
            VStack(spacing: 0) {
                // Messages List
                ScrollViewReader { proxy in
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            // Initial Welcome Message
                            ChatBubble(
                                message: ChatMessage(
                                    content: appState.localized("Hello! I am Morafiq, your medical assistant. ").trimmingCharacters(in: .whitespacesAndNewlines),
                                    isUser: false,
                                    date: Date()
                                )
                            )
                            
                            ForEach(messages) { message in
                                ChatBubble(message: message)
                            }
                            
                            if isLoading {
                                HStack {
                                    Image(systemName: "waveform.circle.fill")
                                        .resizable()
                                        .frame(width: 32, height: 32)
                                        .foregroundColor(.brandBlue)
                                        
                                    ProgressView()
                                        .padding(12)
                                        .background(Color(uiColor: .secondarySystemGroupedBackground))
                                        .cornerRadius(20)
                                        .clipShape(ChatBubbleShape(isUser: false))
                                        .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
                                    Spacer()
                                }
                                .padding(.horizontal, 4)
                            }
                            
                            Color.clear.frame(height: 1).id("bottom")
                        }
                        .padding()
                        .onTapGesture {
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }
                    }
                    .onAppear {
                        scrollViewProxy = proxy
                    }
                    .onChange(of: messages) { _, _ in
                        withAnimation {
                            proxy.scrollTo("bottom", anchor: .bottom)
                        }
                    }
                    .onChange(of: isLoading) { _, newValue in
                        if newValue {
                            withAnimation {
                                proxy.scrollTo("bottom", anchor: .bottom)
                            }
                        }
                    }
                }
                
                // Input Area
                VStack(spacing: 0) {
                    Divider()
                    VStack(alignment: .leading, spacing: 8) {
                        HStack(spacing: 12) {
                            TextField(appState.localized("Type your message..."), text: $inputMessage)
                                .padding(12)
                                .background(Color(uiColor: .secondarySystemGroupedBackground))
                                .cornerRadius(20)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                                )
                                .disabled(!hasMorafiqConsent || isLoading)
                            
                            Button {
                                if !isLoading {
                                    sendMessage()
                                }
                            } label: {
                                Image(systemName: "paperplane.fill")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(width: 44, height: 44)
                                    .background(inputMessage.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? Color.gray : Color.brandBlue)
                                    .clipShape(Circle())
                            }
                            .disabled(!hasMorafiqConsent || inputMessage.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || isLoading)
                        }

                        Text(appState.localized("Messages you type in Morafiq are processed by a third-party AI service (OpenAI). Do not share sensitive personal or medical information."))
                            .font(.caption2)
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding()
                    .background(Color(uiColor: .systemBackground))
                }
            }
            .blur(radius: hasMorafiqConsent ? 0 : 2)
            .allowsHitTesting(hasMorafiqConsent)
        }
        .navigationTitle(appState.localized("Morafiq"))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            startChatSessionIfNeeded()
            presentConsentIfNeeded()
        }
        .onDisappear {
            clearChatSession()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    activeAlert = .leave
                } label: {
                    Image(systemName: "chevron.left")
                        .fontWeight(.semibold)
                }
            }
        }
        .alert(item: $activeAlert) { alert in
            switch alert {
            case .consent:
                return Alert(
                    title: Text(appState.localized("Morafiq Notice")),
                    message: Text(appState.localized("Messages you type in Morafiq (including any text you enter) will be transmitted to a third-party AI service (OpenAI) to generate responses.\n\nDo not share sensitive or medical data.\n\nDo you agree to continue?")),
                    primaryButton: .default(Text(appState.localized("Agree and Continue"))) {
                        hasMorafiqConsent = true
                    },
                    secondaryButton: .cancel(Text(appState.localized("Cancel"))) {
                        exitMorafiq()
                    }
                )
            case .leave:
                return Alert(
                    title: Text(appState.localized("Leave Conversation?")),
                    message: Text(appState.localized("If you leave this page, you will not be able to return to this conversation.")),
                    primaryButton: .destructive(Text(appState.localized("Leave"))) {
                        exitMorafiq()
                    },
                    secondaryButton: .cancel(Text(appState.localized("Stay")))
                )
            }
        }
    }
    
    private func sendMessage() {
        let text = inputMessage.trimmingCharacters(in: .whitespacesAndNewlines)
        guard hasMorafiqConsent, !text.isEmpty, !isLoading else {
            if !hasMorafiqConsent {
                activeAlert = .consent
            }
            return
        }

        startChatSessionIfNeeded()
        
        let userMessage = ChatMessage(content: text, isUser: true, date: Date())
        
        // Update UI immediately on Main Thread
        withAnimation {
            messages.append(userMessage)
            inputMessage = ""
            isLoading = true
        }
        
        Task {
            do {
                // Perform network request
                let reply = try await MorafiqService.shared.sendMessage(text, chatSessionId: chatSessionId)
                
                // Check cancellation before updating UI
                if !Task.isCancelled {
                    await MainActor.run {
                        var aiMessage = ChatMessage(content: reply, isUser: false, date: Date())
                        
                        // Logic to detect if AI is recommending a doctor
                        if text.localizedCaseInsensitiveContains("doctor") || 
                           text.localizedCaseInsensitiveContains("recommend") ||
                           text.localizedCaseInsensitiveContains("who should I see") ||
                           reply.localizedCaseInsensitiveContains("Dr.") {
                            
                            if let doctor = DoctorData.doctors.first(where: { reply.localizedCaseInsensitiveContains($0.name) }) {
                                aiMessage.suggestedDoctor = doctor
                            } 
                            else if text.localizedCaseInsensitiveContains("headache") || text.localizedCaseInsensitiveContains("pain") {
                                aiMessage.suggestedDoctor = DoctorData.doctors.first
                            }
                        }
                        
                        withAnimation {
                            messages.append(aiMessage)
                            isLoading = false
                        }
                    }
                }
            } catch {
                if !Task.isCancelled {
                    await MainActor.run {
                        let errorMessage = ChatMessage(
                            content: appState.localized("Sorry, I'm having trouble connecting right now. Please try again later."),
                            isUser: false,
                            date: Date()
                        )
                        withAnimation {
                            messages.append(errorMessage)
                            isLoading = false
                        }
                    }
                }
            }
        }
    }

    private func exitMorafiq() {
        messages.removeAll()
        inputMessage = ""
        isLoading = false
        clearChatSession()
        appState.selectedTab = 0
        dismiss()
    }

    private func presentConsentIfNeeded() {
        guard !hasMorafiqConsent else { return }
        DispatchQueue.main.async {
            activeAlert = .consent
        }
    }

    private func startChatSessionIfNeeded() {
        guard chatSessionId.isEmpty else { return }
        chatSessionId = UUID().uuidString
        print("Morafiq started chatSessionId:", chatSessionId)
    }

    private func clearChatSession() {
        guard !chatSessionId.isEmpty else { return }
        print("Morafiq cleared chatSessionId:", chatSessionId)
        chatSessionId = ""
    }
}

struct ChatMessage: Identifiable, Equatable {
    let id = UUID()
    let content: String
    let isUser: Bool
    let date: Date
    var suggestedDoctor: Doctor? = nil
    
    static func == (lhs: ChatMessage, rhs: ChatMessage) -> Bool {
        lhs.id == rhs.id
    }
}

struct ChatBubble: View {
    let message: ChatMessage
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 8) {
            if !message.isUser {
                Image(systemName: "waveform.circle.fill")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundColor(.brandBlue)
            } else {
                Spacer()
            }
            
            VStack(alignment: message.isUser ? .trailing : .leading, spacing: 4) {
                Text(message.content.replacingOccurrences(of: "\t", with: "").trimmingCharacters(in: .whitespacesAndNewlines))
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(message.isUser ? Color.brandBlue : Color(uiColor: .secondarySystemGroupedBackground))
                    .foregroundColor(message.isUser ? .white : .primary)
                    .clipShape(ChatBubbleShape(isUser: message.isUser))
                    .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
                
                if let doctor = message.suggestedDoctor {
                    NavigationLink(destination: DoctorProfileView(doctor: doctor)) {
                        Text(appState.localized("Go to Doctor"))
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                            .background(Color.brandTeal)
                            .cornerRadius(12)
                    }
                    .padding(.top, 4)
                }
                
                Text(message.date.formatted(date: .omitted, time: .shortened))
                    .font(.caption2)
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 4)
            }
            .frame(maxWidth: UIScreen.main.bounds.width * 0.75, alignment: message.isUser ? .trailing : .leading)
            
            if message.isUser {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundColor(.gray)
            } else {
                Spacer()
            }
        }
        .padding(.horizontal, 4)
    }
}

struct ChatBubbleShape: Shape {
    let isUser: Bool
    
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        // Ensure valid dimensions and safe radius
        guard width > 0, height > 0 else { return Path() }
        let radius = min(min(width, height) / 2, 20)
        
        return Path { path in
            // Top left corner (Always rounded)
            path.move(to: CGPoint(x: 0, y: radius))
            path.addArc(center: CGPoint(x: radius, y: radius), radius: radius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
            
            // Top right corner (Always rounded)
            path.addLine(to: CGPoint(x: width - radius, y: 0))
            path.addArc(center: CGPoint(x: width - radius, y: radius), radius: radius, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
            
            // Bottom right corner
            if isUser {
                // Square for user (message sender)
                path.addLine(to: CGPoint(x: width, y: height))
            } else {
                // Rounded for AI (receiver)
                path.addLine(to: CGPoint(x: width, y: height - radius))
                path.addArc(center: CGPoint(x: width - radius, y: height - radius), radius: radius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
            }
            
            // Bottom left corner
            if isUser {
                // Rounded for user
                path.addLine(to: CGPoint(x: radius, y: height))
                path.addArc(center: CGPoint(x: radius, y: height - radius), radius: radius, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
            } else {
                // Square for AI
                path.addLine(to: CGPoint(x: 0, y: height))
            }
            
            path.closeSubpath()
        }
    }
}
