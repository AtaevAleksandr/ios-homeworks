//
//  InfoViewController.swift
//  Navigation
//
//  Created by Aleksandr Ataev on 25.11.2022.
//

import UIKit

final class InfoViewController: UIViewController {
    
    //MARK: - Properties
    private let alertButton = UIButton()
    private let exitButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        view.backgroundColor = .systemMint
    }
    
    //MARK: - Methods
    private func setupButtons() {
        view.addSubview(alertButton)
        view.addSubview(exitButton)
        alertButton.configuration = .filled()
        alertButton.configuration?.baseBackgroundColor = .systemPink
        alertButton.configuration?.title = "Alert!"
        alertButton.addTarget(self, action: #selector(alertAction), for: .touchUpInside)
        
        exitButton.configuration = .filled()
        exitButton.configuration?.baseBackgroundColor = .darkGray
        exitButton.configuration?.title = "Exit!"
        exitButton.addTarget(self, action: #selector(exitAction), for: .touchUpInside)
        
        alertButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        
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
        let alertController = UIAlertController(title: "Attention!", message: "To exit this page, click the 'Exit!' button!", preferredStyle: .alert)
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
