//
//  OthersModel.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 04.06.2024.
//

import Foundation

struct OffersModel: Decodable {
    var offers: [OfferModel]
}

struct OfferModel: Decodable {
    var id: Int
    var title: String
    var town: String
    var price: PriceModel
}

struct PriceModel: Decodable {
    var value: Int
}
