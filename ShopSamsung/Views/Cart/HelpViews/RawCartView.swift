//
//  RawCartView.swift
//  ShopSamsung
//
//  Created by Андрей Федоров on 09.12.2022.
//

import SwiftUI

struct RawCartView: View {
    @ObservedObject var viewModel: CartViewModel
    var id: Int 
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: viewModel.cartInfo.basket[id-1].images )) { image in
                image.resizable().scaledToFit().cornerRadius(10)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 111,height: 89)
            VStack(alignment: .leading,spacing: 8){
                Text(viewModel.cartInfo.basket[id-1].title )
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .frame(width: 150)
                Text("$"+"\(viewModel.cartInfo.basket[id-1].price )")
                    .foregroundColor(Color.theme.accentOrange)
                    .fontWeight(.medium)
                    .frame(width: 100)
            }
            
            picker
            
            Image(systemName: "basket")
                .foregroundColor(Color.theme.basketColor)
                .frame(width: 1.25, height: 8.4)
                .padding(.horizontal,8)
            
        }
    }
}
//
//struct RawCartView_Previews: PreviewProvider {
//    static var previews: some View {
//        RawCartView()
//    }
//}


extension RawCartView{
    private var picker: some View{
        VStack{
            Image(systemName: "minus")
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .frame(width: 9,height: 9)
            Text("1")
                .frame(height: 16)
                .foregroundColor(.white)
            Image(systemName: "plus")
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .frame(width: 9,height: 9)
            
        }
        .background(
        RoundedRectangle(cornerRadius: 26)
            .foregroundColor(Color.theme.pickerColor)
            .frame(width: 26,height: 68)
        ).padding(.horizontal)
    }
}
