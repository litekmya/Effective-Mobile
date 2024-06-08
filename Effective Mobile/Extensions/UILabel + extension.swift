//
//  UILabel + extension.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 03.06.2024.
//

import UIKit

extension UILabel {
    
    func setup(font: UIFont, color: UIColor, text: String) {
        textColor = color
        self.font = font
        self.text = text
    }
}
