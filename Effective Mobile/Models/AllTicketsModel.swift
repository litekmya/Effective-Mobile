//
//  AllTicketsModel.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 07.06.2024.
//

import Foundation

struct AllTicketsModel: Decodable {
    var tickets: [OfferedTicketModel]
}

struct OfferedTicketModel: Decodable {
    var id: Int
    var badge: String?
    var price: OfferedPriceModel
    var provider_name: String
    var company: String
    var departure: DepartureModel
    var arrival: ArrivalModel
    var has_transfer: Bool
    var has_visa_transfer: Bool
    var luggage: LuggageModel
    var hand_luggage: HandLuggageModel
    var is_returnable: Bool
    var is_exchangable: Bool
}

struct OfferedPriceModel: Decodable {
    var value: Int
}

struct DepartureModel: Decodable {
    var town: String
    var date: String
    var airport: String
}

struct ArrivalModel: Decodable {
    var town: String
    var date: String
    var airport: String
}

struct LuggageModel: Decodable {
    var has_luggage: Bool
    var price: OfferedPriceModel?
}

struct HandLuggageModel: Decodable {
    var has_hand_luggage: Bool
    var size: String?
}
