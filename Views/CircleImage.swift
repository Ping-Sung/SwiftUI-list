//
//  CircleImage.swift
//  SwiftUI-list
//
//  Created by Kevin on 2025/12/1.
//

import SwiftUI

// overlay 是把一個 view 放到另個 view 上面
struct CircleImage: View {
    var image: Image


    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}


#Preview {
    CircleImage(image: Image("turtlerock"))
}
