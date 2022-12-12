//
//  CartModel.swift
//  ShopSamsung
//
//  Created by Андрей Федоров on 09.12.2022.
//

import Foundation


struct CartModel: Codable, Identifiable {
    let basket: [Basket]
    let delivery, id: String
    let total: Int
}


struct Basket: Codable,Hashable{
    let id: Int
    let images: String
    let price: Int
    let title: String
}
