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
        tabBar.tabBar.backgroundColor = .white    // УБРАТЬ, ЕСЛИ ХОТИТЕ ПРОВЕРИТЬ КОСТОМНЫЙ ТАББАР, КОТОРЫЙ НИЖЕ

        //Set Tab Bar Appearance
//            ПРИ ПОВОРОТЕ ЭКРАНА КАСТОМНЫЙ ТАББАР НЕ МЕНЯЕТ РАЗМЕРОВ В ШИРИНУ, БАГ КОТОРЫЙ НЕ СМОГ РЕШИТЬ, МОЖЕТ ВЫ ПОМОЖЕТЕ С РЕШЕНИЕМ?
//        let positionOnX: CGFloat = 10
//        let positionOnY: CGFloat = 14
//        let width = UIScreen.main.bounds.width - positionOnX * 2
//        let heigth = 49 + positionOnY * 2
//
//        let roundLayer = CAShapeLayer()
//
//        let bezierPath = UIBezierPath(roundedRect: CGRect(x: positionOnX, y: tabBar.tabBar.bounds.minY - positionOnY, width: width, height: heigth),
//                                      cornerRadius: heigth / 2)
//
//        roundLayer.path = bezierPath.cgPath
//        roundLayer.fillColor = UIColor.white.cgColor
//
//        tabBar.tabBar.layer.insertSublayer(roundLayer, at: 0)
//
//        tabBar.tabBar.itemWidth = width / 5
//        tabBar.tabBar.itemPositioning = .centered
//
        return tabBar
    }
}
