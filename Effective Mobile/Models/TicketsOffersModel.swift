//
//  TicketsOffersModel.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 06.06.2024.
//

import Foundation

struct TicketsOffersModel: Decodable {
    var tickets_offers: [TicketModel]
}

struct TicketModel: Decodable {
    var id: Int
    var title: String
    var time_range: [String]
    var price: TicketPriceModel
}

struct TicketPriceModel: Decodable {
    var value: Int
}
