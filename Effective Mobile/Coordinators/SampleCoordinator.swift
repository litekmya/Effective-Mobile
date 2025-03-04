//
//  SampleCoordinator.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 05.06.2024.
//

import UIKit

class SampleCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let sampleVC = SampleViewController()
        
        if let presentedVC = navigationController.presentedViewController {
            presentedVC.present(sampleVC, animated: true)
        } else {
            navigationController.present(sampleVC, animated: true)
        }
    }
}
