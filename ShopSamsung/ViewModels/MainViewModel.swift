//
//  MainViewModel.swift
//  ShopSamsung
//
//  Created by Андрей Федоров on 03.12.2022.
//

import Foundation
//Mark: - viewModel most of all for MainShopView
class MainViewModel: ObservableObject{
    
    @Published var listDevices: [DeviceModel] = [
    DeviceModel(iconName: "platter.filled.top.iphone"),
    DeviceModel(iconName: "laptopcomputer"),
    DeviceModel(iconName:"heart"),
    DeviceModel(iconName:"books.vertical"),
    DeviceModel(iconName: "gamecontroller")
    ]
    
    @Published var listPhones:[PhoneModel] = [
    PhoneModel(phonePhotoName: "phone1", favorites: false, newPrice: "$1,047", oldPrice: "$1,500", phoneName: "Samsung Galaxy s20 Ultra"),
    PhoneModel(phonePhotoName: "phone2", favorites: false, newPrice: "$300", oldPrice: "$400", phoneName: "Xiaomi Mi 10 Pro"),
    PhoneModel(phonePhotoName: "phone3", favorites: false, newPrice: "$1,047", oldPrice: "$1,500", phoneName: "Samsung Note 20 Ultra"),
    PhoneModel(phonePhotoName: "phone4", favorites: false, newPrice: "$300", oldPrice: "$400", phoneName: "Xiaomi Mi 10 Pro")
    ]
    
    @Published var listHotSalesDevices: [HotSalesModel] = [
        HotSalesModel(name: "Iphone 12", subName: "Súper. Mega. Rápido.", photoName: "phoneHoteSales"),
        HotSalesModel(name: "Iphone 12", subName: "Súper. Mega. Rápido.", photoName: "phoneHoteSales"),
        HotSalesModel(name: "Iphone 12", subName: "Súper. Mega. Rápido.", photoName: "phoneHoteSales")
    ]
    
    //Mark: - init for starting getData or smth else
    
    //Mark: - func getData frop url request, part of logic on "Service"
    
}
