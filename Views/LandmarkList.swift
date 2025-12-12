//
//  LandmarkList.swift
//  SwiftUI-list
//
//  Created by Kevin on 2025/12/9.
//
import SwiftUI

struct LandmarkList: View {
    @StateObject private var viewModel = LandmarkViewModel()
    @State private var selectedLandmark: Landmark?

    var body: some View {
        NavigationSplitView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading…")
                } else if let message = viewModel.errorMessage {
                    VStack(spacing: 8) {
                        Text("Error")
                            .font(.headline)
                        Text(message)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                } else {
                    List(viewModel.landmarks, selection: $selectedLandmark) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                    .navigationTitle("Landmarks")
                }
            }
        } detail: {
            if let landmark = selectedLandmark {
                LandmarkDetail(landmark: landmark)
            } else {
                Text("Select a Landmark")
            }
        }
        // 使用 async/await 在畫面出現時抓資料
        .task {
            await viewModel.fetchLandmarks()
        }
    }
}

#Preview {
    LandmarkList()
}
