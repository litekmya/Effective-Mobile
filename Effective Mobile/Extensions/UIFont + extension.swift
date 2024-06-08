//
//  UIFont + extension.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 03.06.2024.
//

import UIKit

extension UIFont {
    
    static func installSFRegular(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "SFProDisplay-Italic", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    static func installSFMedium(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "SFProDisplay-Medium", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    static func installSFSemibold(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "SFProDisplay-Semibold", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    static func installSemiboldItalic(fontSize: CGFloat) -> UIFont {
        return UIFont(name: "SFProDisplay-SemiboldItalic", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}
