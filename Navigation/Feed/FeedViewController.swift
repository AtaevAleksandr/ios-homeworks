//
//  FeedViewController.swift
//  Navigation
//
//  Created by Aleksandr Ataev on 25.11.2022.
//

import UIKit

final class FeedViewController: UIViewController {
    
    //MARK: - Clousers
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .equalSpacing
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy private var buttonOne: UIButton = {
        let firstButton = UIButton()
        firstButton.configuration = .filled()
        firstButton.configuration?.baseBackgroundColor = .black
        firstButton.configuration?.title = "Tap Me!"
        firstButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        return firstButton
    }()
    
    lazy private var buttonTwo: UIButton = {
        let secondButton = UIButton()
        secondButton.configuration = .filled()
        secondButton.configuration?.baseBackgroundColor = .blue
        secondButton.configuration?.title = "or Tap Me!"
        secondButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        return secondButton
    }()
    
    //MARK: - Properties
    private var postTitle = Post(title: "You are in Post View!")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        navigationItem.title = "Feed"
        settings()
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
    
    //MARK: - Methods
    private func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    private func settings() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(buttonOne)
        stackView.addArrangedSubview(buttonTwo)
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
