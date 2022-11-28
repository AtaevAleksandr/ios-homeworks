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
        navigationController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "gamecontroller"), tag: 0)
        return navigationController
    }

    private func createSecondController() -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: ProfileViewController())
        navigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "figure.table.tennis"), tag: 1)
        return navigationController
    }

    func createTabBarController() -> UITabBarController {
        let tabBar = UITabBarController()
        tabBar.viewControllers = [createFirstController(), createSecondController()]
        tabBar.tabBar.backgroundColor = .lightGray
        return tabBar
    }
}
