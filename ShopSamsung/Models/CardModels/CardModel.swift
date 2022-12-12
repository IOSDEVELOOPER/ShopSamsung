//
//  CardModel.swift
//  ShopSamsung
//
//  Created by Андрей Федоров on 07.12.2022.
//

import Foundation
struct CardModel:Codable{
    let cpu, camera: String
        let capacity, color: [String]
        let id: String
        let images: [String]
        let isFavorites: Bool
        let price: Int
        let rating: Double
        let sd, ssd, title: String

        enum CodingKeys: String, CodingKey {
            case cpu = "CPU"
            case camera, capacity, color, id, images, isFavorites, price, rating, sd, ssd, title
        }
}
