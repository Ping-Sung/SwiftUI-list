//
//  ContentView.swift
//  SwiftUI-list
//
//  Created by Kevin on 2025/12/1.
//
import SwiftUI


struct LandmarkDetail: View {
    var landmark: Landmark


    var body: some View {
        ScrollView  {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)


            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)


            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)


                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)


                Divider()


                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()



        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
        // commend + shift + c 可以顯示 logging
        .onAppear {
            debugPrintLandmarks()
        }
    }
}


#Preview {
    LandmarkDetail(landmark: landmarks[0])
}
