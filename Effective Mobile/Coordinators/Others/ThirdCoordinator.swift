//
//  ThirdCoordinator.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 08.06.2024.
//

import UIKit

class ThirdCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let thirdVC = ThirdViewController()
        navigationController.pushViewController(thirdVC, animated: true)
    }
}
