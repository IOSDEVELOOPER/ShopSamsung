//
//  TabBarView.swift
//  ShopSamsung
//
//  Created by Андрей Федоров on 04.12.2022.
//

import SwiftUI
//Mark: - main TabBar
struct TabBarView: View {
    @StateObject var vm: CartViewModel = CartViewModel()
    @Binding var mainStack:[NavigationType]
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .frame(height: 72)
                .foregroundColor(Color.theme.accentBlue)
            HStack{
                Spacer()
                Circle()
                    .foregroundColor(.white)
                    .frame(width: 8,height: 8)
                Text("Explorer")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "bag")
                    .foregroundColor(.white)
                    .frame(width: 18,height: 18)
                    .font(.system(size: 18))
                    .onTapGesture {
                        mainStack.append(.cart)
                    }
                    .overlay {
                        Circle()
                            .foregroundColor(Color.theme.accentOrange)
                            .frame(width: 12)
                            .offset(x:5,y: -5)
                            .overlay {
                                Text(String(vm.cartInfo.basket.count))
                                    .foregroundColor(.white)
                                    .font(.system(size: 10))
                                    .offset(x:5,y:-5)
                            }
                    }
                Spacer()
                Image(systemName: "heart")
                    .foregroundColor(.white)
                    .frame(width: 18,height: 18)
                    .font(.system(size: 18))
                Spacer()
                Image(systemName: "person")
                    .foregroundColor(.white)
                    .frame(width: 18,height: 18)
                    .font(.system(size: 18))
                Spacer()
            }
        }
        .task {
           do{
                try await vm.getData()
            }catch{
                print("error")
            }
        }
    }
}

//struct TabBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBarView(mainStack: <#T##Binding<[NavigationType]>#>)
//    }
//}
