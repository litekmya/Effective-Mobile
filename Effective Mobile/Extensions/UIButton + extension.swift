//
//  UIButton + extension.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 07.06.2024.
//

import UIKit

extension UIButton {
    
    func setupImageAndTitle(imageName: String, title: String, tint: UIColor, font: UIFont) {
        let imageSize = CGSize(width: 16, height: 16)
        if let image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate) {
            let resizedImage = resizeImage(image: image, targetSize: imageSize)
            setImage(resizedImage.withTintColor(tint), for: .normal)
        }
        
        setTitle(title, for: .normal)
        backgroundColor = .clear
        imageEdgeInsets.left = -5
        titleLabel?.font = font
        setTitleColor(tint, for: .normal)
        contentEdgeInsets = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        sizeToFit()
    }
    
    private func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        return renderer.image { _ in
            image.draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }
}
