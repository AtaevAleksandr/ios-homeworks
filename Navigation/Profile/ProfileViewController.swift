//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Aleksandr Ataev on 25.11.2022.
//

import UIKit

final class ProfileViewController: UIViewController {

    let profileHeaderView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Profile"
        view.addSubview(profileHeaderView)
        profileHeaderView.setupSettings()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }

    override func viewWillLayoutSubviews() {
        profileHeaderView.frame = view.frame
        profileHeaderView.backgroundColor = .systemGray4
    }
}
