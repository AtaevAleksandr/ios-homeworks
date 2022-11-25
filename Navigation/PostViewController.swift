//
//  PostViewController.swift
//  Navigation
//
//  Created by Aleksandr Ataev on 25.11.2022.
//

import UIKit

final class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange

        let rightBarButtonItem = UIBarButtonItem(title: "Info", style: .done, target: self, action: #selector(infoPressed))
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }


    @objc func infoPressed() {
        self.dismiss(animated: true)
        let newViewController = InfoViewController()
        present(newViewController, animated: true)
    }
}
