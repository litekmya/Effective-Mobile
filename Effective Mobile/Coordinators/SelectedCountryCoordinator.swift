//
//  SelectedCountryCoordinator.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 05.06.2024.
//

import UIKit

class SelectedCountryCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var fromText: String
    var inText: String
    
    init(navigationController: UINavigationController, fromText: String, inText: String) {
        self.navigationController = navigationController
        self.fromText = fromText
        self.inText = inText
    }
    
    func start() {
        let viewModel = SelectedCountryVierwModel(fromText: fromText, inText: inText)
        let selectedCountryVC = SelectedCountryViewController(viewModel: viewModel, coordinator: self)
//        selectedCountryVC.modalPresentationStyle = .fullScreen
        
//        if let presentedVC = navigationController.presentedViewController {
//            presentedVC.present(selectedCountryVC, animated: true)
//        } else {
//            navigationController.present(selectedCountryVC, animated: true)
//        }
        navigationController.pushViewController(selectedCountryVC, animated: true)
    }
    
    func goToAllTickets(departureTime: String, departurePlace: String, arrivalPlace: String) {
        let allTicketsCoodinator = AllTicketsCoordinator(navigationController: navigationController, departureTime: departureTime, departurePlace: departurePlace, arrivalPlace: arrivalPlace)
        allTicketsCoodinator.start()
    }
}
