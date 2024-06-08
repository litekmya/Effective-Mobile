//
//  SearchViewModel.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 04.06.2024.
//

import Foundation

protocol SearchViewModelProtocol {
    
    init(fromString: String)
    
    func getNubmerOfSections() -> Int
    func getNumberOfRows() -> Int
    func getDirectionsData() -> [DirectionModel]
    func getHelpData() -> [HelpModel]
    func getFromString() -> String
}

class SearchViewModel: SearchViewModelProtocol {
    
    private let helps = HelpModel.getData()
    private let directions = DirectionModel.getData()
    private let fromString: String
    
    required init(fromString: String) {
        self.fromString = fromString
    }
        
    func getNubmerOfSections() -> Int {
        helps.count
    }
    
    func getNumberOfRows() -> Int {
        directions.count
    }
    
    func getDirectionsData() -> [DirectionModel] {
        directions
    }
    
    func getHelpData() -> [HelpModel] {
        helps
    }
    
    func getFromString() -> String {
        fromString
    }
}
