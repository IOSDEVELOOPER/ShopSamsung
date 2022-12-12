//
//  ColorExtansion.swift
//  ShopSamsung
//
//  Created by Андрей Федоров on 03.12.2022.
//

import Foundation
import SwiftUI

extension Color{
    //Mark: - singleton
    static let theme = ColorTheme()
}

//Mark: - extension for special color, which we often use in ior projet
struct ColorTheme{
    let accentOrange = Color("accentOrange")
    let accentBlue = Color("accentBlue")
    let accentGray = Color("accentGray")
    let background = Color("background")
    let accentGray2 = Color("accentGray2")
    let colorHotSales = Color("colorHotSales")
    let starYelow = Color("starYelow")
    let phoneColor1 = Color("phoneColor1")
    let phoneColor2 = Color("phoneColor2")
    let pickerColor = Color("pickerColor")
    let basketColor = Color("basketColor")
}
