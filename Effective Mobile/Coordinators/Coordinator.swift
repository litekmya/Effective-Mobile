//
//  Coordinator.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 03.06.2024.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
