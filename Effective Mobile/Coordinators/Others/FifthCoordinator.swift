//
//  FifthCoordinator.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 08.06.2024.
//

import UIKit

class FifthCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let fifthVC = FifthViewController()
        navigationController.pushViewController(fifthVC, animated: true)
    }
}
