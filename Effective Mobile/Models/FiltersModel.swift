//
//  FiltersModel.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 05.06.2024.
//

import UIKit

struct FiltersModel {
    var image: UIImage?
    var title: String
    var day: String
    
    static func getData() -> [FiltersModel] {
        return [
            FiltersModel(image: UIImage(systemName: "plus"), title: "обратно", day: ""),
            FiltersModel(image: nil, title: getCurrentDate().0, day: ", \(getCurrentDate().1)"),
            FiltersModel(image: UIImage(systemName: "person"), title: "1, эконом", day: ""),
            FiltersModel(image: UIImage(systemName: "slider.horizontal.3"), title: "фильтры", day: "")
        ]
    }
    
    static private func getCurrentDate() -> (String, String) {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "dd MMM"
        dateformatter.locale = Locale(identifier: "ru_RU")
        
        let dateString = dateformatter.string(from: Date())
        
        dateformatter.dateFormat = "EE"
        
        let weekdayString = dateformatter.string(from: Date()).lowercased()
        
        return (dateString, weekdayString)
    }
}
