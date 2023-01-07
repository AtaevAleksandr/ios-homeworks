//
//  InfoViewController.swift
//  Navigation
//
//  Created by Aleksandr Ataev on 25.11.2022.
//

import UIKit

final class InfoViewController: UIViewController {

    //MARK: - Clousers
    private lazy var alertButton: UIButton = {
        let alert = UIButton()
        alert.configuration = .filled()
        alert.configuration?.baseBackgroundColor = .systemPink
        alert.configuration?.title = "Alert!"
        alert.addTarget(self, action: #selector(alertAction), for: .touchUpInside)
        alert.translatesAutoresizingMaskIntoConstraints = false
        return alert
    }()

    private lazy var exitButton: UIButton = {
        let exit = UIButton()
        exit.configuration = .filled()
        exit.configuration?.baseBackgroundColor = .darkGray
        exit.configuration?.title = "Exit!"
        exit.addTarget(self, action: #selector(exitAction), for: .touchUpInside)
        exit.translatesAutoresizingMaskIntoConstraints = false
        return exit
    }()

    //MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        view.backgroundColor = .systemMint
    }

    private func setupButtons() {
        view.addSubview(alertButton)
        view.addSubview(exitButton)
        
        NSLayoutConstraint.activate([
            alertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            alertButton.widthAnchor.constraint(equalToConstant: 120),
            alertButton.heightAnchor.constraint(equalToConstant: 40),
            
            exitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            exitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            exitButton.widthAnchor.constraint(equalToConstant: 100),
            exitButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func alertAction() {
        let alertController = UIAlertController(title: "Attention!", message: "To exit this page, click the 'Exit!' button!",
                                                preferredStyle: .alert)
        let alertOkAction = UIAlertAction(title: "OK", style: .destructive) { _ in
            print("'OK' is tapped!")
        }
        let alertCancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("'Cancel' is tapped!")
        }
        alertController.addAction(alertOkAction)
        alertController.addAction(alertCancelAction)
        present(alertController, animated: true)
    }
    
    @objc func exitAction() {
        dismiss(animated: true)
    }
}
