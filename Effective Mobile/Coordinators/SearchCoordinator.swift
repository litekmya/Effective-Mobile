//
//  SearchCoordinator.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 05.06.2024.
//

import UIKit

class SearchCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var fromString: String
    
    init(navigationController: UINavigationController, fromString: String) {
        self.navigationController = navigationController
        self.fromString = fromString
    }
    
    func start() {
        let viewModel = SearchViewModel(fromString: fromString)
        let searchVC = SearchViewController(viewModel: viewModel, coordinator: self)
        
        navigationController.present(searchVC, animated: true)
    }
    
    func goToExample() {
        let sampleCoordinator = SampleCoordinator(navigationController: navigationController)
        sampleCoordinator.start()
    }
    
    func goToSelectedCountry(fromText: String, inText: String) {
        let selectedCountryCoordinator = SelectedCountryCoordinator(navigationController: navigationController, fromText: fromText, inText: inText)
        selectedCountryCoordinator.start()
    }
}
