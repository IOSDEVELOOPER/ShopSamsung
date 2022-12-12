//
//  PhoneModel.swift
//  ShopSamsung
//
//  Created by Андрей Федоров on 04.12.2022.
//

import Foundation
//Mark: - model for ScrollShopView
struct PhoneModel: Identifiable{
    var id = UUID()
    var phonePhotoName: String
    var favorites: Bool
    var newPrice: String
    var oldPrice: String
    var phoneName: String
}
