//
//  Landmark.swift
//  SwiftUI-list
//
//  Created by Kevin on 2025/11/25.
//

import Foundation
import SwiftUI
import CoreLocation

// Hashable, Codable, Identifiable is the protocol of Landmark.
// Hashable: check unique
// Codable: convert between Json and struct
// Identifiable: tell SwiftUI Landmark have UID
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String

    // 宣告圖片相關的要分開處理
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    // How does it know what Coordinates type is? The struct is not defined yet?!
    private var coordinates: Coordinates

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
}
