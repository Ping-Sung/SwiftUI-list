//
//  LandmarkList.swift
//  SwiftUI-list
//
//  Created by Kevin on 2025/12/9.
//
import SwiftUI


struct LandmarkList: View {
    var body: some View {
        NavigationSplitView {
            // id: \.id 等同於react 的 key={item.id}
            // this is use to do delete, update.
            // if landmarks have Identifiable protocol, no need for key.
            List(landmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}


#Preview {
    LandmarkList()
}
