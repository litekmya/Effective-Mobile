//
//  UITextField + extension.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 04.06.2024.
//

import UIKit

extension UITextField {
    
    func setup(color: UIColor, placeholder: String) {
        textColor = color
        attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.grey6]
        )
    }
}
