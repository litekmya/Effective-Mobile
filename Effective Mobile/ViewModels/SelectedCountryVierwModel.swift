//
//  SelectedCountryVierwModel.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 05.06.2024.
//

import Foundation

protocol SelectedCountryVierwModelProtocol {
    
    init(fromText: String, inText: String)
    func getNumberOfSections() -> Int
    func getFilters() -> [FiltersModel]
    func getDataForFields() -> (String, String)
    func getNumberOfRows() -> Int
    func getDataForCell() -> [TicketModel]
    func getColorNames() -> [String]
    func getDataFromNetwork(competion: @escaping() -> Void)
    func getChoosenDate(date: Date, index: Int, completion: @escaping() -> Void)
    func getCurrentStringDate(date: Date) -> String
}

class SelectedCountryVierwModel: SelectedCountryVierwModelProtocol {
    
    private var fromText: String
    private var inText: String
    
    private var filters = FiltersModel.getData()
    
    private let networkManager = NetworkManager.shared
    private var tickets: [TicketModel] = []
    
    private let dateFormatter = DateFormatter()
    
    required init(fromText: String, inText: String) {
        self.fromText = fromText
        self.inText = inText
    }
    
    func getNumberOfSections() -> Int {
        filters.count
    }
    
    func getFilters() -> [FiltersModel] {
        filters
    }
    
    func getDataForFields() -> (String, String) {
        return (fromText, inText)
    }
    
    
    
    func getColorNames() -> [String] {
        return ["newRed", "newBlue", "white"]
    }
    
    func getDataFromNetwork(competion: @escaping () -> Void) {
        networkManager.fetchDerivedFlights { result in
            switch result {
            case .success(let requestedTickets):
                DispatchQueue.main.async {
                    self.tickets = requestedTickets
                    competion()
                }
            case .failure(let error):
                print(error.localizedDescription)
                //обработка ошибки, например вывод алерта об ошибке
            }
        }
    }
    
    func getNumberOfRows() -> Int {
        tickets.count
    }
    
    func getDataForCell() -> [TicketModel] {
        tickets
    }
    
    func getChoosenDate(date: Date, index: Int, completion: @escaping() -> Void) {
        dateFormatter.dateFormat = "dd MMM"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        let dateString = dateFormatter.string(from: date)
        
        dateFormatter.dateFormat = "EE"
        let weekdayString = dateFormatter.string(from: date).lowercased()
        
        setValueForCollection(date: dateString, weekday: weekdayString, index: index) {
            completion()
        }
    }
    
    func getCurrentStringDate(date: Date) -> String {
        dateFormatter.dateFormat = "d MMMM"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    private func setValueForCollection(date: String, weekday: String, index: Int, completion: @escaping() -> Void) {
        for currentIndex in 0..<filters.count {
            if currentIndex == index {
                filters[currentIndex].title = date
                filters[currentIndex].day = weekday
                
                completion()
            }
        }
    }
}
