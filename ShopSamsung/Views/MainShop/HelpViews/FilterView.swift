//
//  FilterView.swift
//  ShopSamsung
//
//  Created by Андрей Федоров on 04.12.2022.
//

import SwiftUI

//Mark: - filter view, which appear after click on special button on mainShopView
struct FilterView: View {
    @Binding var showFilterView: Bool
    var body: some View {
        VStack{
            HStack{
                Button {
                    withAnimation(.spring()){
                        showFilterView.toggle()
                    }
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .rotationEffect(Angle(degrees: 45))
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 37,height: 37)
                                .foregroundColor(Color.theme.accentBlue)
                        }
                }
                .padding(.leading)
                Spacer()
                Text("Filter options")
                Spacer()
                Button {
                    withAnimation(.spring()){
                        showFilterView.toggle()
                    }
                } label: {
                    Text("Done")
                        .foregroundColor(.white)
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.theme.accentOrange)
                                .frame(width: 86,height: 37)
                        }
                }
                .padding(.trailing)
                
            }
            VStack {
                HStack {
                    Text("Brand")
                        .foregroundColor(Color.theme.accentBlue)
                        .padding(.top, 35)
                        .padding(.leading,10)
                    Spacer()
                }
                .padding(.bottom,8)
                HStack {
                    Text("Samsung")
                        .padding(.horizontal)
                    Spacer()
                    Image(systemName: "arrow.down")
                        .foregroundColor(Color.theme.accentGray)
                        .padding(.horizontal)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.theme.accentGray)
                        .frame(height: 37)
                        .padding(.horizontal,5)
                }
                
                
                
                HStack {
                    Text("Price")
                        .foregroundColor(Color.theme.accentBlue)
                        .padding(.top,8)
                        .padding(.leading,10)
                    Spacer()
                }
                .padding(.bottom,8)
                HStack {
                    Text("$300-$500")
                        .padding(.horizontal)
                    Spacer()
                    Image(systemName: "arrow.down")
                        .foregroundColor(Color.theme.accentGray)
                        .padding(.horizontal)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.theme.accentGray)
                        .frame(height: 37)
                        .padding(.horizontal,5)
                }
                
                
                
                HStack {
                    Text("Size")
                        .foregroundColor(Color.theme.accentBlue)
                        .padding(.top,8)
                        .padding(.leading,10)
                    Spacer()
                }
                .padding(.bottom,8)
                HStack {
                    Text("$4.5 to 5.5 inches")
                        .padding(.horizontal)
                    Spacer()
                    Image(systemName: "arrow.down")
                        .foregroundColor(Color.theme.accentGray)
                        .padding(.horizontal)
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.theme.accentGray)
                        .frame(height: 37)
                        .padding(.horizontal,5)
                }
                .padding(.bottom)
                
                
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color.white)
        )
        .padding()
    }
}

//struct FilterView_Previews: PreviewProvider {
//    static var previews: some View {
//        FilterView()
//    }
//}
