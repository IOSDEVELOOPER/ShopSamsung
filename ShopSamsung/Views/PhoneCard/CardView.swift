//
//  PhoneCardView.swift
//  ShopSamsung
//
//  Created by Андрей Федоров on 05.12.2022.
//

import SwiftUI

struct CardView: View {
    @ObservedObject private var viewModel: CardViewModel = CardViewModel()
    @Binding var mainStack: [NavigationType]
    @State private var selectedCategories = "Shop"
    @State private var selectedColor = "#772D03"
    @State private var selectedMemory = ""
    @State private var raiting: Float = 0
    var body: some View {
        ZStack{
            Color.theme.background.ignoresSafeArea()
            VStack {
                header
                HStack{
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack{
                            ForEach(viewModel.cardInfo.images, id: \.self){url in
                                AsyncImage(url: URL(string: url)) { image in
                                    image.resizable().scaledToFit()
                                } placeholder: {
                                    ProgressView()
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                
                            }
                        }
                    }
                }
                .frame(height: 350)
                .padding(.horizontal)
                
                
                Spacer()
                DetailCard(viewModel:viewModel,selectedCategories: $selectedCategories,selectedColor: $selectedColor,selectedMemory: $selectedMemory,raiting: $raiting)
                    .padding()
            }
        }
        .task {
            do{
                try await viewModel.getData()
                raiting = Float(viewModel.cardInfo.rating)
                selectedMemory = viewModel.cardInfo.sd
            }catch let error{
                print(error)
            }
        }
    }
}


//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//    }
//}

extension CardView{
    private var header: some View{
        HStack {
            Spacer()
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
            Text("Product Details")
                .font(.system(size: 18))
                .fontWeight(.semibold)
            Spacer()
            Image(systemName: "bag")
                .foregroundColor(.white)
                .onTapGesture {
                    mainStack.append(.cart)
                }
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.theme.accentOrange)
                        .frame(width: 37,height: 37)
                )
                
            Spacer()
            
        }
        .padding(.top,32)
        .padding(.bottom,8)
    }
}
