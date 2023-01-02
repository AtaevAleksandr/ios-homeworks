//
//  LogInViewController.swift
//  Navigation
//
//  Created by Aleksandr Ataev on 28.12.2022.
//

import UIKit

final class LogInViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        addSubviews()
        setConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        scrollView.contentSize = CGSize(width: .zero, height: UIScreen.main.bounds.height + 300)
        addObservers()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        removeObservers()
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width + 300, height: .zero)
    }

    //MARK: - Clousers
    private lazy var logo: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "logo.png")
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()

    private lazy var stackView: UIStackView = {
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

    private lazy var loginTextField: UITextField = {
        let login = UITextField()
        login.placeholder = "Email of phone"
        login.font = .systemFont(ofSize: 16)
        login.autocapitalizationType = .none
        login.clearButtonMode = .whileEditing
        login.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: login.frame.height))
        login.leftViewMode = .always
        setKeyboardSettings(forUITextField: login)
        return login
    }()

    private lazy var passwordTextField: UITextField = {
        let password = UITextField()
        password.placeholder = "Password"
        password.isSecureTextEntry = true
        password.font = .systemFont(ofSize: 16)
        password.autocapitalizationType = .none
        password.clearButtonMode = .whileEditing
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: password.frame.height))
        password.leftViewMode = .always
        setKeyboardSettings(forUITextField: password)
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
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()

    //MARK: - Methods
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [logo, stackView, logInButton].forEach { contentView.addSubview($0) }
        [loginTextField, separator, passwordTextField].forEach { stackView.addArrangedSubview($0) }
    }

    private func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide), name: UIResponder.keyboardDidHideNotification, object: nil)
    }

    private func removeObservers() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func buttonPressed() {
        let viewController = ProfileViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }

    @objc private func keyboardDidShow(notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        let keyboardFrameSize: CGRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        scrollView.setContentOffset(CGPoint(x: 0, y: 100), animated: true)
        scrollView.contentSize = CGSize(width: .zero, height: view.bounds.size.height + keyboardFrameSize.height)
    }

    @objc private func keyboardDidHide(notification: Notification) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }

    private func setKeyboardSettings(forUITextField textField: UITextField) {
        textField.delegate = self
        textField.autocorrectionType = .no
        textField.returnKeyType = .done
        textField.enablesReturnKeyAutomatically = true
        let tapOnView = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapOnView)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        return true
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            // scroll view
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),

            //content view
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, constant: 300),

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
}

