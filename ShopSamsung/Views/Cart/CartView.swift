//
//  CartView.swift
//  ShopSamsung
//
//  Created by Андрей Федоров on 09.12.2022.
//

import SwiftUI

struct CartView: View {
    @StateObject private var viewModel: CartViewModel = CartViewModel()
    @Binding var mainStack:[NavigationType]
    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            VStack {
                header
                HStack {
                    Text("My Cart")
                        .font(.system(size: 35))
                        .fontWeight(.semibold)
                    Spacer()
                }
                .padding(.top, 38)
                .padding(.horizontal,60)
                Spacer()
                VStack(spacing: 25){
                    ForEach(viewModel.cartInfo.basket, id: \.self){raw in
                        RawCartView(viewModel: viewModel, id: raw.id)
                            .frame(maxWidth: .infinity)
                    }
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 1)
                        .foregroundColor(.white.opacity(0.25))
                        .padding(.top,100)

                    totalDelivery
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 1)
                        .foregroundColor(.white.opacity(0.2))
                    
                    Button {
                        //
                    } label: {
                        Text("Checkout")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.theme.accentOrange)
                                .frame(width: 326,height: 54)
                            )
                    }
                    .padding(.vertical,32)

                }
                .padding(.vertical,32)
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(Color.theme.accentBlue)
                )
            }
            .ignoresSafeArea()
            .task {
                do{
                    try await viewModel.getData()
                }catch let error{
                    print(error)
                }
        }
        }
    }
}

//struct CartView_Previews: PreviewProvider {
//    static var previews: some View {
//        CartView()
//    }
//}

extension CartView{
    private var totalDelivery: some View{
        HStack(){
            VStack(alignment: .leading, spacing: 12){
                Text("Total")
                    .foregroundColor(.white)
                    .font(.system(size: 15))
                Text("Delivery")
                    .foregroundColor(.white)
                    .font(.system(size: 15))
            }
            Spacer()
            VStack(alignment: .leading, spacing: 12){
                Text("$"+String(viewModel.cartInfo.total)+" us")
                    .foregroundColor(.white)
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
                Text(viewModel.cartInfo.delivery)
                    .foregroundColor(.white)
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
            }
        }
        .padding(.horizontal,52)
    }
    
    private var header: some View{
        HStack {
            Button {
                mainStack.removeLast()
            } label: {
                Image(systemName: "arrow.left")
                    .foregroundColor(.white)
                    .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.theme.accentBlue)
                        .frame(width: 37,height: 37)
                    )
               
            }
            Spacer()
           Text("Add adress")
                .font(.system(size: 15))
                .padding(.horizontal,10)
            Image(systemName: "mappin")
                .foregroundColor(.white)
                .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.theme.accentOrange)
                    .frame(width: 37,height: 37)
                )
            
        }
        .padding(.horizontal,68)
        .padding(.top,60)
    }
}
