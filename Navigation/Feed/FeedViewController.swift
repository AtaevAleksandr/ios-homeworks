//
//  FeedViewController.swift
//  Navigation
//
//  Created by Aleksandr Ataev on 25.11.2022.
//

import UIKit

final class FeedViewController: UIViewController {

    //MARK: - Clousers
    private let tapButton: UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.configuration?.baseBackgroundColor = .black
        button.configuration?.title = "Tap Me!"
        button.addTarget(FeedViewController.self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    //MARK: - Properties
    private var postTitle = Post(title: "You are in Post View!")

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        view.backgroundColor = .gray
        navigationItem.title = "Feed"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }

    //MARK: - Methods
    private func setupButtons() {
        view.addSubview(tapButton)

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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
