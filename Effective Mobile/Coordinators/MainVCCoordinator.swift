//
//  TicketsSearchCoordinator.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 03.06.2024.
//

import UIKit

class MainVCCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = MainVCViewModel()
        let mainVC = ViewController(viewModel: viewModel)
        navigationController.pushViewController(mainVC, animated: true)
    }
    
}
