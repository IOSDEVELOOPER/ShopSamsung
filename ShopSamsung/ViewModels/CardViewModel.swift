//
//  CardViewModel.swift
//  ShopSamsung
//
//  Created by Андрей Федоров on 07.12.2022.
//

import Foundation
import Combine

class CardViewModel: ObservableObject{
    @Published var cardInfo: CardModel = CardModel(cpu: "", camera: "", capacity: [""], color: [""], id: "", images: [""], isFavorites: true, price: 2, rating: 2, sd: "", ssd: "", title: "")
    let url = URL(string: "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5")!
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
        self.cardInfo = try! decoder.decode(CardModel.self, from: data)
    }
    
    
}
