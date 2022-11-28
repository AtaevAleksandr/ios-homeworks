//
//  FeedViewController.swift
//  Navigation
//
//  Created by Aleksandr Ataev on 25.11.2022.
//

import UIKit

final class FeedViewController: UIViewController {

    //MARK: - Properties
    private let tapButton = UIButton()
    private var postTitle = Post(title: "You are in Post View!")

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        view.backgroundColor = .yellow
    }

    //MARK: - Methods

    private func setupButtons() {
        view.addSubview(tapButton)
        tapButton.configuration = .filled()
        tapButton.configuration?.baseBackgroundColor = .systemRed
        tapButton.configuration?.title = "Tap Me!"
        tapButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        tapButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tapButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tapButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tapButton.widthAnchor.constraint(equalToConstant: 100),
            tapButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    @objc func buttonAction() {
        let newViewController = PostViewController()
        navigationController?.pushViewController(newViewController, animated: true)
        newViewController.title = postTitle.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
