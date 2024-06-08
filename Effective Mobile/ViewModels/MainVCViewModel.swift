//
//  MainVCViewModel.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 03.06.2024.
//

import Foundation

protocol MainVCViewModelProtocol: AnyObject {
    func getDataFromNetwork(completion: @escaping() -> Void)
    func getImages() -> [ImageModel]
    func getNumberOfSections() -> Int
    func getDataForCell() -> [OfferModel]
    
    func getDepartureText() -> String
    func saveDeparture(text: String)
}

class MainVCViewModel: MainVCViewModelProtocol {
    
    private let networkManager = NetworkManager.shared
    private let defaultsManager = UserDefaultsManager.shared
    
    private var offers: [OfferModel] = []
    private let imageModels = ImageModel.getData()
    
    func getDataFromNetwork(completion: @escaping() -> Void) {
        networkManager.fetchOffers { result in
            switch result {
            case .success(let requestedOffers):
                DispatchQueue.main.async {
                    self.offers = requestedOffers
                    completion()
                }
            case .failure(let error):
                print(error.localizedDescription)
                //обработка ошибки, например вывод алерта об ошибке
            }
        }
    }
    
    func getImages() -> [ImageModel] {
        imageModels
    }
    
    func getNumberOfSections() -> Int {
        offers.count
    }
    
    func getDataForCell() -> [OfferModel] {
        offers
    }
    
    func getDepartureText() -> String {
        defaultsManager.getDepartureText()
    }
    
    func saveDeparture(text: String) {
        defaultsManager.setDeparture(text: text)
    }
}
