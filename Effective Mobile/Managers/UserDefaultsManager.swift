//
//  UserDefaultsManager.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 07.06.2024.
//

import Foundation

class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    
    private init() {}
    
    func setDeparture(text: String) {
        UserDefaults.standard.set(text, forKey: "fromTextFieldText")
    }
    
    func getDepartureText() -> String {
        UserDefaults.standard.string(forKey: "fromTextFieldText") ?? ""
    }
}
