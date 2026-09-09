import Foundation

class MorafiqService {
    static let shared = MorafiqService()
    private let userIdKey = "userId"
    
    private init() {}
    
    func sendMessage(_ message: String, chatSessionId: String) async throws -> String {
        guard let url = URL(string: "https://hayatt.app.n8n.cloud/webhook/5adc636f-3357-4de3-b9c1-451916df494e") else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 30
        
        let userId = currentUserId()
        
        let body: [String: String] = [
            "message": message,
            "userId": userId,
            "chatSessionId": chatSessionId
        ]
        
        let bodyData = try JSONSerialization.data(withJSONObject: body)
        request.httpBody = bodyData

        print("Morafiq outgoing message:", message)
        print("Morafiq outgoing userId:", userId)
        print("Morafiq outgoing chatSessionId:", chatSessionId)
        print("Morafiq outgoing JSON body:", String(data: bodyData, encoding: .utf8) ?? "{}")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let decodedResponse = try JSONDecoder().decode(MorafiqResponse.self, from: data)
        return decodedResponse.reply
    }

    private func currentUserId() -> String {
        if let storedUserId = UserDefaults.standard.string(forKey: userIdKey), !storedUserId.isEmpty {
            return storedUserId
        }

        let newUserId = UUID().uuidString
        UserDefaults.standard.set(newUserId, forKey: userIdKey)
        return newUserId
    }
}

struct MorafiqResponse: Codable {
    let reply: String
}
