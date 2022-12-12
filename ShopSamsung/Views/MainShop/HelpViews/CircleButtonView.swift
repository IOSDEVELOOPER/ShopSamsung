//
//  CircleButton.swift
//  ShopSamsung
//
//  Created by Андрей Федоров on 03.12.2022.
//

import SwiftUI
//Mark: - may be this struct will help us with upgrade our app in the future and optomization
struct CircleButtonView: View {
    var device: DeviceModel
    var body: some View {
        VStack {
            Image(systemName: device.iconName)
                .font(.system(size: 30))
                .symbolRenderingMode(.palette)
        }
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonView(device: DeviceModel(iconName: "phone"))
    }
}
