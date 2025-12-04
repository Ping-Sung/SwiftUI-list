//
//  ModelData.swift
//  SwiftUI-list
//
//  Created by Kevin on 2025/12/1.
//

import Foundation

var landmarks: [Landmark] = load("landmarkData.json")

// 這是一個 泛型（Generic）函式
//T: Decodable 表示你要求回傳的型別 必須可以被 JSONDecoder 解析

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    // 這guard let 綁定 Optional 的語法 early exit
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }


    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }


    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

// 測試用的程式碼，沒啥好講的，放在logging用的
func debugPrintLandmarks() {
    print(landmarks.count)
    print(landmarks.first?.name ?? "No name")
}
