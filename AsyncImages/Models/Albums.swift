//
//  Albums.swift
//  AsyncImages
//
//  Created by Jeffrey Tabios on 12/6/21.
//

import Foundation

struct Albums: Codable {
    let offset: Int
    let count: Int
    let total: Int
    let results: [Album]
    
    enum CodingKeys: String, CodingKey {
        case offset = "Offset"
        case count = "Count"
        case total = "Total"
        case results = "Results"
    }
}

struct Album: Codable {
    let primaryRelease: PrimaryRelease
    
    enum CodingKeys: String, CodingKey {
        case primaryRelease = "PrimaryRelease"
    }
}
struct PrimaryRelease: Codable {
    let image: String

    enum CodingKeys: String, CodingKey {
        case image = "Image"
    }
}
