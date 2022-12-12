//
//  DetailCard.swift
//  ShopSamsung
//
//  Created by Андрей Федоров on 05.12.2022.
//

import SwiftUI

struct DetailCard: View {
    let categoriesList:[String] = ["Shop", "Details", "Features"]
    let memoryList: [String] = ["128 GB","256 GB"]
    @ObservedObject var viewModel : CardViewModel
    @Binding  var selectedCategories: String
    @Binding  var selectedColor :String
    @Binding  var selectedMemory :String
    @Binding  var raiting: Float
    @Namespace private var namespace
    var body: some View {
        VStack {
            header
            categories
                .padding(.bottom,24)
            characteristic
                .padding(.bottom,40)
            HStack {
                Text("Select color and capacity")
                    .fontWeight(.semibold)
                    .font(.system(size: 16))
                Spacer()
            }.padding(.horizontal)
            
            selectedColorAndSd
                .padding(.horizontal)
            Button {
                //
            } label: {
                HStack {
                    Spacer()
                    Text("Add to Cart")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Spacer()
                    Text("$1,500.0")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Spacer()
                }
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 54)
                        .foregroundColor(Color.theme.accentOrange)
                )
                .padding()
                .padding(.vertical,28)
                
            }

        }.padding(.horizontal)
            .background(
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(Color.white)
            )
            
    }
}
//
//struct DetailCard_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailCard(selectedCategories: "", selectedColor: "", selectedMemory: "", raiting: "")
//    }
//}

extension DetailCard{
    private var stars: some View{
        HStack(spacing: 10) {
            ForEach(1..<6){index in
                Image(systemName: "star.fill")
                    .frame(width: 18,height: 18)
            }
        }
    }
    
    private func starsCount(raiting: Float) -> Bool {
        if raiting.truncatingRemainder(dividingBy: Float(Int(raiting))) == 0{
            return true
        }
        else{
            return false
        }
    }
    
    private var overlay: some View{
        GeometryReader{geometry in
            ZStack (alignment: .leading){
                Rectangle()
                    .foregroundColor(Color.theme.starYelow.opacity(1))
                    .frame(width: starsCount(raiting: raiting) ? CGFloat(raiting*1.075)/5 * geometry.size.width : CGFloat(Float(Int(raiting))+0.35+0.075*Float(Int(raiting)))/5*geometry.size.width)
            }
        }
    }
    
    private var categories: some View{
        HStack{
            ForEach(categoriesList, id: \.self){category in
                ZStack{
                    if selectedCategories == category{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.theme.accentOrange)
                            .matchedGeometryEffect(id: "roundedRectangleUnderscore", in: namespace)
                            .frame(width: 86,height: 3)
                            .offset(y: 15)
                    }
                    Text(category)
                        .font(.system(size: 20))
                        .foregroundColor(selectedCategories == category ? Color.theme.accentBlue : Color.theme.accentGray)
                        .fontWeight(selectedCategories == category ? .bold : .regular)
                        .onTapGesture {
                            withAnimation(.easeOut){
                                selectedCategories = category
                            }
                        }
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
    
    private var characteristic: some View{
        HStack(spacing: 65){
            Image(systemName: "cpu")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.theme.accentGray)
                .frame(width: 28)
                .overlay {
                    Text(viewModel.cardInfo.cpu)
                        .foregroundColor(Color.theme.accentGray)
                        .font(.system(size: 11))
                        .frame(width: 64)
                        .offset(y:25)
                }
            Image(systemName: "camera")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.theme.accentGray)
                .frame(width: 28)
                .overlay {
                    Text(viewModel.cardInfo.camera)
                        .foregroundColor(Color.theme.accentGray)
                        .font(.system(size: 11))
                        .frame(width: 68)
                        .offset(y:25)
                }
            Image(systemName: "memorychip")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.theme.accentGray)
                .frame(width: 28)
                .overlay {
                    Text(viewModel.cardInfo.sd)
                        .foregroundColor(Color.theme.accentGray)
                        .font(.system(size: 11))
                        .frame(width: 64)
                        .offset(y:25)
                }
            Image(systemName: "sdcard")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color.theme.accentGray)
                .frame(width: 22)
                .overlay {
                    Text(viewModel.cardInfo.ssd)
                        .foregroundColor(Color.theme.accentGray)
                        .font(.system(size: 11))
                        .frame(width: 64)
                        .offset(y:25)
                }
        }
    }
    
    private func chooseColor(color: String) -> Color{
        switch color{
        case "#772D03":
            return Color.theme.phoneColor1
        case "#010035":
            return Color.theme.phoneColor2
        default:
            return Color.black
        }
    }
    
    
    private var selectedColorAndSd: some View{
        VStack{
            HStack{
                ForEach(viewModel.cardInfo.color, id: \.self){color in
                    ZStack {
                        Circle()
                            .foregroundColor(chooseColor(color: color))
                            .frame(width: 39.29)
                            .onTapGesture {
                                selectedColor = color
                            }
                            .padding(.horizontal,4)
                            .overlay {
                                if selectedColor == color{
                                    Image(systemName: "checkmark")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(Color.white)
                                        .frame(width: 16.96,height: 12.5)
                                }
                        }
                    }
                }
                Spacer()
                HStack(spacing: 40){
                    ForEach(memoryList, id: \.self){memory in
                        Text(memory)
                            .font(.system(size: 13))
                            .fontWeight(.semibold)
                            .foregroundColor(selectedMemory == memory ? .white : Color.theme.accentGray)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(selectedMemory == memory ? Color.theme.accentOrange : .white)
                                    .frame(width: 71.43,height: 30.36)
                            )
                    }
                }
            }
        }
    }
    private var header: some View{
        HStack(alignment: .top) {
            VStack (alignment: .leading){
                Text(viewModel.cardInfo.title)
                    .foregroundColor(Color.theme.accentBlue)
                    .fontWeight(.medium)
                    .font(.system(size: 24))
                stars
                .overlay {
                    overlay
                   .mask(stars)
                }
            }
            Spacer()
            Image(systemName:viewModel.cardInfo.isFavorites ? "heart.fill" : "heart")
                .foregroundColor(viewModel.cardInfo.isFavorites ? Color.theme.accentOrange : .white)
                .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.theme.accentBlue)
                    .frame(width: 37,height: 33)
                )
                .padding(.top,8)
        }
        .padding()
    }
}
