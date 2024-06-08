//
//  NetworkManager.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 04.06.2024.
//

import Foundation

enum Link {
    case offers
    case selectedCountries
    case allTickets
    
    var url: URL? {
        switch self {
        case .offers:
            return URL(string: "https://run.mocky.io/v3/214a1713-bac0-4853-907c-a1dfc3cd05fd")
        case .selectedCountries:
            return URL(string: "https://run.mocky.io/v3/7e55bf02-89ff-4847-9eb7-7d83ef884017")
        case .allTickets:
            return URL(string: "https://run.mocky.io/v3/670c3d56-7f03-4237-9e34-d437a9e56ebf")
        }
    }
}

enum NetworkError: Error {
    case noData
    case toManyRequests
    case decodingError
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchOffers(completion: @escaping(Result<[OfferModel], NetworkError>) -> Void) {
        guard let url = Link.offers.url else {
            completion(.failure(.noData))
            return
        }
        
        performRequest(url: url, decodingType: OffersModel.self) { result in
            switch result {
            case .success(let offersModel):
                completion(.success(offersModel.offers))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchDerivedFlights(completion: @escaping(Result<[TicketModel], NetworkError>) -> Void) {
        guard let url = Link.selectedCountries.url else {
            completion(.failure(.noData))
            return
        }
        
        performRequest(url: url, decodingType: TicketsOffersModel.self) { result in
            switch result {
            case .success(let ticketsModel):
                completion(.success(ticketsModel.tickets_offers))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchAllTickets(completion: @escaping(Result<[OfferedTicketModel], NetworkError>) -> Void) {
        guard let url = Link.allTickets.url else {
            completion(.failure(.noData))
            return
        }
        
        performRequest(url: url, decodingType: AllTicketsModel.self) { result in
            switch result {
            case .success(let allTicketsModel):
                completion(.success(allTicketsModel.tickets))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
        
    private func performRequest<T: Decodable>(url: URL, decodingType: T.Type, completion: @escaping(Result<T, NetworkError>) -> Void) {
        let fetchRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: fetchRequest) { data, response, error in
            if error != nil {
                completion(.failure(.noData))
            }
            
            let httpResponse = response as! HTTPURLResponse
            
            if httpResponse.statusCode == 429 {
                completion(.failure(.toManyRequests))
            } else {
                guard let data = data else { return }
                
                do {
                    let decodedData = try JSONDecoder().decode(decodingType, from: data)
                    completion(.success(decodedData))
                } catch let error {
                    print(error.localizedDescription)
                    completion(.failure(.decodingError))
                }
            }
        }.resume()
    }
}
