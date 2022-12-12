//
//  MainShopView.swift
//  ShopSamsung
//
//  Created by Андрей Федоров on 03.12.2022.
//

import SwiftUI

struct MainShopView: View {
    private var numberOfColumns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @State var mainStack:[NavigationType] = []
    @State private var showFilterView: Bool = false
    @ObservedObject var MainVM: MainViewModel = MainViewModel()
    @State private var selectedDevice : DeviceModel? = nil
    @State private var searchText: String = ""
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack(path: $mainStack) {
                ZStack{
                    Color.theme.background.ignoresSafeArea()
                    VStack{
                        VStack(spacing:0){
                            header
                            ScrollDevices
                            searchField
                            ScrollView {
                                VStack{
                                    hotSales
                                    bestSeller
                                }
                                .offset(y:showFilterView ?  300: 0)
                            }
                            Spacer()
                        }
                        .opacity(showFilterView ? 0.5 : 1)
                        TabBarView(mainStack: $mainStack)
                    }
                    if showFilterView{
                        withAnimation(.spring()){
                            FilterView(showFilterView: $showFilterView)
                                .transition(.move(edge: .bottom))
                        }
                    }
                }
                .navigationDestination(for: NavigationType.self) {value in
                    switch value{
                    case .cart : CartView(mainStack: $mainStack).navigationBarBackButtonHidden(true)
                    case .card : CardView(mainStack: $mainStack).navigationBarBackButtonHidden(true)
                    }
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

struct MainShopView_Previews: PreviewProvider {
    static var previews: some View {
        MainShopView()
    }
}

enum NavigationType: Hashable{
    case cart
    case card
}


extension MainShopView{
    
    //Mark: - return one device
    private func CircleDevice(device: DeviceModel) -> some View{
        CircleButtonView(device: device)
            .onTapGesture {
                selectedDevice = device
            }
            .foregroundColor(selectedDevice?.iconName == device.iconName ? Color.white : Color.theme.accentGray)
            .background(
                Circle()
                    .foregroundColor(device.iconName == selectedDevice?.iconName ? Color.theme.accentOrange : Color.white)
                    .frame(width: 71,height: 71)
            )
            .shadow(radius: 0.5)
            .padding(.horizontal)
            .padding(.vertical,36)
    }
    
    //MArk: - Scrolling list of devices
    private var ScrollDevices: some View{
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(spacing: 20){
                ForEach(MainVM.listDevices, id: \.self ){device in
                   CircleDevice(device: device)
                        .overlay {
                            Text(chooseDevice(device: device))
                                .font(.system(size: 12))
                                .foregroundColor(selectedDevice == device ? Color.theme.accentOrange : .black)
                                .offset(y:48)
                        }
                }
            }
            .padding(.horizontal,25)
        }
    }
    
    //Mark: - HeaderText and Filter
    private var header: some View{
        VStack{
            HStack{
                Spacer()
                Image(systemName: "mappin")
                    .foregroundColor(Color.theme.accentOrange)
                Text("Zihuatanejo, Gro")
                    .fontWeight(.medium)
                    .font(.system(size: 15))
                Spacer()
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundColor(Color.theme.accentOrange)
                    .onTapGesture {
                        withAnimation(.spring()){
                            showFilterView.toggle()
                        }
                    }
            }
            .padding(.horizontal,20)
            .padding(.bottom, 18)
            HStack {
                Text("Selected category")
                    .font(.system(size: 25))
                    .fontWeight(.semibold)
                Spacer()
                Text("view all")
                    .foregroundColor(Color.theme.accentOrange)
                    .font(.system(size: 15))
            }
            .padding(.horizontal,20)
        }
    }
    
    //Mark: - Upgraded TextField
    private var searchField: some View{
        HStack {
            ZStack {
                HStack {
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 320,height: 34)
                    .foregroundColor(.white)
                    .shadow(radius: 0.5)
                    Image(systemName: "viewfinder.circle")
                        .foregroundColor(Color.theme.accentOrange)
                }
                HStack {
                    Image(systemName:"magnifyingglass")
                        .foregroundColor(Color.theme.accentOrange)
                    TextField("Search", text: $searchText)
                        .padding(.horizontal)
                }
                .padding(.horizontal)
            }
            .padding(.vertical,20)
            .padding(.horizontal,32)
            
        }
    }
    
    private var bestSeller: some View{
        VStack{
            HStack {
                Text("Best Seller")
                    .font(.system(size: 25))
                    .fontWeight(.semibold)
                Spacer()
                Text("see more")
                    .font(.system(size: 15))
                    .foregroundColor(Color.theme.accentOrange)
            }
            .padding(.horizontal)
            ScrollView{
                LazyVGrid(columns: numberOfColumns) {
                    ForEach(MainVM.listPhones){phone in
                        PhoneCardView(phone: phone)
                            .onTapGesture {
                                mainStack.append(.card)
                            }
                    }
                }
            }.padding(.horizontal)
        }
    }
    
    private var hotSales: some View{
        VStack{
            HStack {
                Text("Hot sales")
                    .fontWeight(.semibold)
                    .font(.system(size: 25))
                Spacer()
                Text("see more")
                    .foregroundColor(Color.theme.accentOrange)
                    .font(.system(size: 15))
            }
            .padding(.horizontal)
            ScrollView(.horizontal,showsIndicators: false) {
                HStack{
                    ForEach(MainVM.listHotSalesDevices, id: \.self ){device in
                        HotSalesView(device: device)
                            .frame(height: 200)
                    }
                }

            }
        }
    }
    
    private func chooseDevice(device:DeviceModel)->String{
        switch device.iconName{
        case "platter.filled.top.iphone":
            return "Phones"
        case "laptopcomputer":
            return "Computers"
        case "heart":
            return "Health"
        case "books.vertical":
            return "Books"
        case "gamecontroller":
            return "Games"
        default:
            return ""
        }
   
        
    }
}
