//
//  SecondCoordinator.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 08.06.2024.
//

import UIKit

class SecondCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let secondVC = SecondViewController()
        navigationController.pushViewController(secondVC, animated: true)
    }
}
