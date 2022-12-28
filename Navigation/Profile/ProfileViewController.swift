//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Aleksandr Ataev on 25.11.2022.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    //MARK: - Clousers
    private let profileHeaderView: ProfileHeaderView = {
        let profileView = ProfileHeaderView()
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileView.backgroundColor = .lightGray
        return profileView
    }()
    
    private let changeNameButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.configuration?.title = "Change Name"
        button.configuration?.baseBackgroundColor = .black
        button.addTarget(self, action: #selector(changeUserNameLabel), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        navigationItem.title = "Profile"
        view.addSubview(profileHeaderView)
        view.addSubview(changeNameButton)
        profileHeaderView.setupSettings()
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            //profile header view
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 250),
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            //change name button
            changeNameButton.topAnchor.constraint(equalTo: profileHeaderView.setStatusButton.bottomAnchor, constant: 16),
            changeNameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeNameButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc private func changeUserNameLabel() {
        let alertController = UIAlertController(title: "Attention!", message: "If you want to change the name, just change and press 'OK', if not press 'Cancel'!", preferredStyle: .alert)
        
        let alertOkAction = UIAlertAction(title: "OK", style: .destructive) { _ in
            let text = alertController.textFields?.first?.text
            self.profileHeaderView.userNameLabel.text = text
            print("'OK' is tapped!")
        }
        
        let alertCancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("'Cancel' is tapped!")
        }
        alertController.addTextField()
        alertController.addAction(alertOkAction)
        alertController.addAction(alertCancelAction)
        present(alertController, animated: true)
    }
}
