//
//  Extension + SceneDelegate.swift
//  Navigation
//
//  Created by Aleksandr Ataev on 25.11.2022.
//

import Foundation
import UIKit

extension SceneDelegate {

    private func createFirstController() -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: FeedViewController())
        navigationController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "house.fill"), tag: 0)
        return navigationController
    }

    private func createSecondController() -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: LogInViewController())
        navigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 1)
        return navigationController
    }

    func createTabBarController() -> UITabBarController {
        let tabBar = UITabBarController()
        tabBar.viewControllers = [createFirstController(), createSecondController()]
        tabBar.tabBar.layer.borderWidth = 0.5
        tabBar.tabBar.layer.borderColor = UIColor.lightGray.cgColor
        tabBar.tabBar.backgroundColor = .white
        return tabBar
    }
}
