//
//  UIView + exntension.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 04.06.2024.
//

import UIKit

extension UIView {
    
    func makeShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 16
    }
}
