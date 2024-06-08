//
//  AppDelegate.swift
//  Effective Mobile
//
//  Created by Владимир Ли on 03.06.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: MainCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        appCoordinator = MainCoordinator(navigationController: navigationController)
        appCoordinator?.start()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        setupTabBar()
        return true
    }

    private func setupTabBar() {
        UITabBarController().tabBar.backgroundColor = .black
        UITabBarController().tabBar.tintColor = .newDarkBlue
        UITabBarController().tabBar.unselectedItemTintColor = .grey6
    }
}

