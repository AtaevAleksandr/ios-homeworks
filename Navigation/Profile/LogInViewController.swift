//
//  LogInViewController.swift
//  Navigation
//
//  Created by Aleksandr Ataev on 28.12.2022.
//

import UIKit

final class LogInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        addSubviews()
        setConstraints()
        scrollView.keyboardDismissMode = .interactive
    }

    override func viewDidAppear(_ animated: Bool) {
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 400)
    }

    //MARK: - Clousers
    private let logo: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "logo.png")
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()

    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .systemGray6
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.alignment = .fill
        stack.layer.borderWidth = 0.5
        stack.layer.borderColor = UIColor.lightGray.cgColor
        stack.layer.cornerRadius = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 0
        return stack
    }()

    private let loginTextField: UITextField = {
        let login = UITextField()
        login.placeholder = "Email of phone"
        login.font = .systemFont(ofSize: 16)
        login.autocapitalizationType = .none
        login.clearButtonMode = .whileEditing
        login.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: login.frame.height))
        login.leftViewMode = .always
        return login
    }()

    private let passwordTextField: UITextField = {
        let password = UITextField()
        password.placeholder = "Password"
        password.isSecureTextEntry = true
        password.font = .systemFont(ofSize: 16)
        password.autocapitalizationType = .none
        password.clearButtonMode = .whileEditing
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: password.frame.height))
        password.leftViewMode = .always
        return password
    }()

    private lazy var logInButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "blue_pixel.png")
        button.clipsToBounds = true
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(image, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let separator: UIView = {
        let separator = UIView()
        separator.backgroundColor = .lightGray
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    }()

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
//        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var contentView: UIView = {
        let contentView = UIView()
//        contentView.backgroundColor = .white
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()

    //MARK: - Methods
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logo)
        contentView.addSubview(stackView)
        contentView.addSubview(logInButton)
        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(separator)
        stackView.addArrangedSubview(passwordTextField)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            // scroll view
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            //content view
            contentView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.bottomAnchor),

            //logo
            logo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logo.heightAnchor.constraint(equalToConstant: 100),
            logo.widthAnchor.constraint(equalToConstant: 100),

            //stack view
            stackView.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 120),
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 361),
            stackView.heightAnchor.constraint(equalToConstant: 100),

            //log in button
            logInButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            logInButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logInButton.widthAnchor.constraint(equalToConstant: 361),
            logInButton.heightAnchor.constraint(equalToConstant: 50),

            //separator
            separator.heightAnchor.constraint(equalToConstant: 0.5),
            separator.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 1)
        ])
    }

    @objc func buttonPressed() {
        let viewController = ProfileViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        let keyboardFrame: CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        var contentInset: UIEdgeInsets = scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 20
        scrollView.contentInset = contentInset
//        let x = keyboardFrame.height - (scrollView.frame.maxY - logInButton.frame.maxY)
//        scrollView.contentOffset = CGPoint(x: 0, y: x)
    }

    @objc fileprivate func keyboardWillHide(_ notification: NSNotification) {
        scrollView.contentInset = .zero
//        scrollView.contentOffset = .zero
    }

    fileprivate func setupTapGesture() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapNear)))
    }

    @objc fileprivate func tapNear() {
        view.endEditing(true)
        view.layoutIfNeeded()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
}

