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
        view.backgroundColor = .darkGray

        let rightBarButtonItem = UIBarButtonItem(title: "Info", style: .done, target: self, action: #selector(infoPressed))
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }


    @objc func infoPressed() {
        self.dismiss(animated: true)
        let newViewController = InfoViewController()
        present(newViewController, animated: true)
    }
}
