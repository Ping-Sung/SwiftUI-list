//
//  ContentView.swift
//  SwiftUI-list
//
//  Created by Kevin on 2025/12/1.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .frame(height: 300)


            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)


            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                HStack {
                    Text("Joshua Tree National Park")
                    Spacer()
                    Text("California")
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)


                Divider()


                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
            }
            .padding()


            Spacer()
        }
        // commend + shift + c 可以顯示 logging
        .onAppear {
            debugPrintLandmarks()
        }
    }
}


#Preview {
    ContentView()
}
