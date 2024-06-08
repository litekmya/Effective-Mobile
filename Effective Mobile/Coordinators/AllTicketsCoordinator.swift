//
//  AllTicketsCoordinator.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 06.06.2024.
//

import UIKit

class AllTicketsCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var departureTime = ""
    var departurePlace = ""
    var arrivalPlace = ""
    
    init(navigationController: UINavigationController, departureTime: String, departurePlace: String, arrivalPlace: String) {
        self.navigationController = navigationController
        self.departureTime = departureTime
        self.departurePlace = departurePlace
        self.arrivalPlace = arrivalPlace
    }
    
    func start() {
        let viewModel = AllTicketsViewModel(
            departureTime: departureTime,
            departurePlace: departurePlace,
            arrivalPlace: arrivalPlace
        )
        
        let allTicketsVC = AllTicketsViewController(viewModel: viewModel)
        navigationController.pushViewController(allTicketsVC, animated: true)
    }
}
