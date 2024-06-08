//
//  FourthCoordinator.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 08.06.2024.
//

import UIKit

class FourthCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let fourthVC = FourthViewController()
        navigationController.pushViewController(fourthVC, animated: true)
    }
}
