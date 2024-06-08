//
//  AllTicketsViewModel.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 06.06.2024.
//

import Foundation

protocol AllTicketsViewModelProtocol {
    
    init(departureTime: String, departurePlace: String, arrivalPlace: String)
    
    func getDepartureTime() -> String
    func getPlaces() -> String
    func getNumberOfSection() -> Int
    func getDataFromNetwork(completion: @escaping() -> Void)
    func getAllTickets() -> [OfferedTicketModel]
    
    func convertDate(dateString: String) -> String
    func calculateTheDifference(departureDate: String, arrivalDate: String) -> String
}

class AllTicketsViewModel: AllTicketsViewModelProtocol {
    
    private let networkManager = NetworkManager.shared
    private var allTickets: [OfferedTicketModel] = []
    private let departureTime: String
    private let departurePlace: String
    private let arrivalPlace: String
    
    required init(departureTime: String, departurePlace: String, arrivalPlace: String) {
        self.departureTime = departureTime
        self.departurePlace = departurePlace
        self.arrivalPlace = arrivalPlace
    }
    
    func getDepartureTime() -> String {
        departureTime
    }
    
    func getPlaces() -> String {
        return "\(departurePlace)-\(arrivalPlace)"
    }
    
    func getDataFromNetwork(completion: @escaping() -> Void) {
        networkManager.fetchAllTickets { result in
            switch result {
            case .success(let requestedTickets):
                self.allTickets = requestedTickets
                completion()
            case .failure(let error):
                print(error.localizedDescription)
                //обработка ошибки, например вывод алерта об ошибке
            }
        }
    }
    
    func getNumberOfSection() -> Int {
        allTickets.count
    }
    
    func getAllTickets() -> [OfferedTicketModel] {
        allTickets
    }
    
    func convertDate(dateString: String) -> String {
        var timeString = ""
        
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        if let date = inputDateFormatter.date(from: dateString) {
            let outputDateFormatter = DateFormatter()
            outputDateFormatter.dateFormat = "HH:mm" 
            
            timeString = outputDateFormatter.string(from: date)
        }
        
        return timeString
    }
    
    func calculateTheDifference(departureDate: String, arrivalDate: String) -> String {
        var timeDifferenceString = ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        // Парсим строки в объекты Date
        if let startDate = dateFormatter.date(from: departureDate),
           let endDate = dateFormatter.date(from: arrivalDate) {
            // Вычисляем разницу между датами
            let calendar = Calendar.current
            let components = calendar.dateComponents([.hour, .minute], from: startDate, to: endDate)
            
            if let hours = components.hour, let minutes = components.minute {
                // Переводим разницу во времени в часы и минуты
                let totalMinutes = (hours * 60) + minutes
                let totalHours = Double(totalMinutes) / 60.0
                
                // Форматируем разницу во времени в строку
                timeDifferenceString = String(format: "%.1fч", totalHours)
            }
        }
        
        return timeDifferenceString
    }
}
