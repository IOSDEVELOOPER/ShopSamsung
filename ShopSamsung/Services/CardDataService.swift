//
//  CardDataService.swift
//  ShopSamsung
//
//  Created by Андрей Федоров on 08.12.2022.
//

import Foundation
import Combine

class CardDataService{
    @Published var cardInfoList: [CardModel] = []
    
    private var cardSubscription: AnyCancellable?
    
    init(){
        getCard()
    }
    private func getCard(){
        guard let url = URL(string: "http://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5") else{return}
        cardSubscription = NetworkingManager.download(url: url)
            .decode(type: [CardModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion){ [weak self] (returnedCard) in
                self?.cardInfoList = returnedCard
                self?.cardSubscription?.cancel()
            }
    }
}
