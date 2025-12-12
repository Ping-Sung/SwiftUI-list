//
//  LandmarkViewModel.swift
//  SwiftUI-list
//
//  Created by Kevin on 2025/12/11.
//

import Foundation

@MainActor
class LandmarkViewModel: ObservableObject {
    @Published var landmarks: [Landmark] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func fetchLandmarks() async {
        guard let url = URL(string: "http://127.0.0.1:5001/landmarks") else {
            errorMessage = "Invalid URL"
            return
        }

        isLoading = true
        errorMessage = nil

        do {
            let (data, response) = try await URLSession.shared.data(from: url)

            if let httpResponse = response as? HTTPURLResponse,
               !(200...299).contains(httpResponse.statusCode) {
                errorMessage = "Server error: \(httpResponse.statusCode)"
                isLoading = false
                return
            }

            let decoded = try JSONDecoder().decode([Landmark].self, from: data)
            self.landmarks = decoded
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
    
    /// 刪除一個 landmark：打 DELETE /landmarks/{id}，成功後從本地陣列移除
    func delete(landmark: Landmark) async -> Bool {
        guard let url = URL(string: "http://127.0.0.1:5001/landmarks/\(landmark.id)") else {
            errorMessage = "Invalid URL"
            return false
        }

        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"

        isLoading = true
        defer { isLoading = false }

        do {
            let (_, response) = try await URLSession.shared.data(for: request)

            if let httpResponse = response as? HTTPURLResponse,
               !(200...299).contains(httpResponse.statusCode) {
                errorMessage = "Delete failed: \(httpResponse.statusCode)"
                return false
            }

            // 從本地列表移除這筆資料
            self.landmarks.removeAll { $0.id == landmark.id }
            return true
        } catch {
            errorMessage = error.localizedDescription
            return false
        }
    }
}
