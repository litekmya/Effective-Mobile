//
//  ImageModel.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 04.06.2024.
//

import UIKit

struct ImageModel {
    var id: Int
    var image: UIImage
    
    static func getData() -> [ImageModel] {
        return [
            ImageModel(id: 1, image: UIImage(named: "image1")!),
            ImageModel(id: 2, image: UIImage(named: "image2")!),
            ImageModel(id: 3, image: UIImage(named: "image3")!)
        ]
    }
}
