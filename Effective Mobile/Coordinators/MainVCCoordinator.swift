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
        let mainVC = ViewController(viewModel: viewModel, coordinator: self)
        navigationController.pushViewController(mainVC, animated: true)
    }
    
    func goToSearch(fromString: String) {
        let searchCoordinator = SearchCoordinator(navigationController: navigationController, fromString: fromString)
        searchCoordinator.start()
    }
}
