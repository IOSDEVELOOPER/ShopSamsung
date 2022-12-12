//
//  CartViewModel.swift
//  ShopSamsung
//
//  Created by Андрей Федоров on 09.12.2022.
//

import Foundation

class CartViewModel:ObservableObject{
    @Published var cartInfo : CartModel = CartModel(basket: [Basket(id: 1, images: "", price: 2, title: "")], delivery: "", id: "", total: 2)
    let url = URL(string: "https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149")!
    let decoder = JSONDecoder()
    init(){
        //
    }
    
    func getData() async throws -> () {
        
        let data = try await URLSession.shared.data(from: url).0
        await updateUI(data: data)
    }
    @MainActor
    private func updateUI (data: Data){
        self.cartInfo = try! decoder.decode(CartModel.self, from: data)
    }
    
}
