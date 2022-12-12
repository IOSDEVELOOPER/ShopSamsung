//
//  HotSalesView.swift
//  ShopSamsung
//
//  Created by Андрей Федоров on 04.12.2022.
//

import SwiftUI
//Mark: - element of scrollView on MainShopView with "fixed scrol gesture"(may be scrollin will be describe there, depend on logic)
struct HotSalesView: View {
    var device: HotSalesModel
    var body: some View {
        
        HStack {
            VStack (alignment: .leading){
                Circle()
                    .foregroundColor(Color.theme.accentOrange)
                    .frame(width: 27)
                    .overlay {
                        Text("New")
                            .foregroundColor(.white)
                            .font(.system(size: 10))
                    }
                    .padding(.bottom,8)
                Text(device.name)
                    .font(.system(size: 25))
                    .fontWeight(.semibold)
                Text(device.subName)
                    .fontWeight(.regular)
                    .font(.system(size: 11))
                    .padding(.bottom)
                
                HStack {
                    Text("Buy now!")
                        .font(.system(size: 11))
                        .fontWeight(.semibold)
                        .frame(width: 98,height: 23)
                }
                .background {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(.white)
                }
            }
            .padding(.leading)
            Image(device.photoName)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .background(
            Color.theme.colorHotSales
        )
        .cornerRadius(15)
        .padding(.horizontal,8)

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
//        HStack {
//            VStack(alignment: .leading) {
//                Circle()
//                    .frame(width: 27)
//                    .foregroundColor(Color.theme.accentOrange)
//                    .padding(.bottom,18)
//                    .overlay {
//                        Text("New")
//                            .foregroundColor(.white)
//                            .font(.system(size: 10))
//                            .offset(y:-9)
//                    }
//                Text(device.name)
//                    .font(.system(size: 25))
//                    .fontWeight(.semibold)
//
//                Text(device.subName)
//                    .font(.system(size: 11))
//                    .padding(.bottom,26)
//
//                VStack (alignment: .center){
//                    Text("Buy now")
//                        .font(.system(size: 11))
//                        .frame(width: 98,height: 23)
//                        .background(
//                        RoundedRectangle(cornerRadius: 5)
//                            .foregroundColor(Color.theme.accentGray)
//                        )
//                }
//            }
//            .padding(.vertical,13)
//            Image(device.photoName)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//
//        }
//        .padding(.horizontal)
//        .background(
//        RoundedRectangle(cornerRadius: 10)
//            .foregroundColor(Color.theme.colorHotSales)
//        )
   }
}

struct HotSalesView_Previews: PreviewProvider {
    static var previews: some View {
        HotSalesView(device: HotSalesModel(name: "Iphone 12", subName: "Súper. Mega. Rápido.", photoName: "phoneHoteSales"))
    }
}
