//
//  MainCoordinator.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 03.06.2024.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var tabbarController: UITabBarController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabbarController = UITabBarController()
    }
    
    func start() {
        tabbarController.selectedIndex = 0
        
        let mainNavigationController = UINavigationController()
        let mainVCCoordinator = MainVCCoordinator(navigationController: mainNavigationController)
        mainVCCoordinator.start()
    
        mainNavigationController.tabBarItem = UITabBarItem(title: "Авиабилеты", image: UIImage(named: "Icon"), selectedImage: nil)
        
        let secondNavigationController = UINavigationController()
        let secondCoordinator = SecondCoordinator(navigationController: secondNavigationController)
        secondCoordinator.start()
    
        secondNavigationController.tabBarItem = UITabBarItem(title: "Отели", image: UIImage(systemName: "bed.double.fill"), selectedImage: nil)
        
        let thirdNavigationController = UINavigationController()
        let thirdCoordinator = ThirdCoordinator(navigationController: thirdNavigationController)
        thirdCoordinator.start()
    
        thirdNavigationController.tabBarItem = UITabBarItem(title: "Короче", image: UIImage(named: "location"), selectedImage: nil)
        
        let fourthNavigationController = UINavigationController()
        let fourthCoordinator = FourthCoordinator(navigationController: fourthNavigationController)
        fourthCoordinator.start()
    
        fourthNavigationController.tabBarItem = UITabBarItem(title: "Подписки", image: UIImage(systemName: "bell.fill"), selectedImage: nil)
        
        let fifthNavigationController = UINavigationController()
        let fifthCoordinator = FifthCoordinator(navigationController: fifthNavigationController)
        fifthCoordinator.start()
    
        fifthNavigationController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.fill"), selectedImage: nil)
        
        tabbarController.viewControllers = [
            mainNavigationController,
            secondNavigationController,
            thirdNavigationController,
            fourthNavigationController,
            fifthNavigationController
        ]
        navigationController.viewControllers = [tabbarController]
    }
}
