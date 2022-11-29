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
        let navigationController = UINavigationController(rootViewController: ProfileViewController())
        navigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 1)
        return navigationController
    }

    func createTabBarController() -> UITabBarController {
        let tabBar = UITabBarController()
        tabBar.viewControllers = [createFirstController(), createSecondController()]
        tabBar.tabBar.backgroundColor = .white

//        //Set Tab Bar Appearance
//        let positionOnX: CGFloat = 10
//        let positionOnY: CGFloat = 14
//        let width = tabBar.tabBar.bounds.width - positionOnX * 2
//        let heigth = tabBar.tabBar.bounds.height + positionOnY * 2
//
//        let roundLayer = CAShapeLayer()
//
//        let bezierPath = UIBezierPath(roundedRect: CGRect(x: positionOnX, y: tabBar.tabBar.bounds.minY - positionOnY, width: width, height: heigth), cornerRadius: heigth / 2)
//
//        roundLayer.path = bezierPath.cgPath
//        tabBar.tabBar.layer.insertSublayer(roundLayer, at: 0)
//
//        tabBar.tabBar.itemWidth = width / 5
//        tabBar.tabBar.itemPositioning = .centered

        return tabBar
    }
}
