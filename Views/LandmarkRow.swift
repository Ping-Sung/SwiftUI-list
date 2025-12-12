//
//  LandmarkRow.swift
//  SwiftUI-list
//
//  Created by Kevin on 2025/12/3.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack{
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            
            Spacer()
        }
    }
}

#Preview {
//    Group {
//        LandmarkRow(landmark: landmarks[0])
//        LandmarkRow(landmark: landmarks[1])
//    }
}
// 可以有多個preview, 但現在暫時不需要就先取消掉
//#Preview("Silver Salmon Creek") {
//    LandmarkRow(landmark: landmarks[1])
//}
