//
//  PhoneCardView.swift
//  ShopSamsung
//
//  Created by Андрей Федоров on 04.12.2022.
//

import SwiftUI
//Mark: - element of Grid in scrollView in main shop
struct PhoneCardView: View {
    var phone: PhoneModel
    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            VStack {
                Image(phone.phonePhotoName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 181,height: 168)
                HStack{
                    Text(phone.newPrice)
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(Color.theme.accentBlue)
                    Text(phone.oldPrice)
                            .font(.system(size: 10))
                        .foregroundColor(Color.theme.accentGray2)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.theme.accentGray2)
                            .frame(width: 31,height: 1)
                                 )
                    Spacer()
                }
                .padding(.horizontal)
                HStack {
                    Text(phone.phoneName)
                        .fontWeight(.medium)
                        .font(.system(size: 10))
                    Spacer()
                }
                .padding(.horizontal)
            }
            .frame(width: 181,height: 227)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.white)
            }
        }
    }
}

struct PhoneCardView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneCardView(phone: PhoneModel(phonePhotoName: "phone1", favorites: false, newPrice: "$1,500", oldPrice: "$1,047", phoneName: "Samsung Galaxy s20 Ultra"))
    }
}
