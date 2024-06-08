//
//  HelpModel.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 04.06.2024.
//

import UIKit

struct HelpModel {
    var title: String
    var image: UIImage
    
    static func getData() -> [HelpModel] {
        return [
            HelpModel(title: "Сложный маршрут", image: UIImage(named: "icon")!),
            HelpModel(title: "Куда угодно", image: UIImage(named: "icon1")!),
            HelpModel(title: "Выходные", image: UIImage(named: "icon2")!),
            HelpModel(title: "Горячие билеты", image: UIImage(named: "icon3")!)
        ]
    }
}

struct DirectionModel {
    var title: String
    var image: UIImage
    
    static func getData() -> [DirectionModel] {
        return [
            DirectionModel(title: "Стамбул", image: UIImage(named: "direction")!),
            DirectionModel(title: "Сочи", image: UIImage(named: "direction1")!),
            DirectionModel(title: "Пхукет", image: UIImage(named: "direction2")!)
        ]
    }
}
