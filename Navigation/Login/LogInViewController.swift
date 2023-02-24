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
        addSubviews()
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
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
    
    //MARK: - Properties
    private var data = Data(email: "onlyRock@mail.ru", password: "OnlyRock12345")
    
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
        login.tag = 1
        login.addTarget(self, action: #selector(fieldTapped), for: .editingChanged)
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
        password.tag = 2
        password.addTarget(self, action: #selector(fieldTapped), for: .editingChanged)
        return password
    }()
    
    private lazy var hiddenLabel: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        [logo, stackView, hiddenLabel, logInButton].forEach { contentView.addSubview($0) }
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
        if loginTextField.text == data.email && passwordTextField.text == data.password {
            let viewController = ProfileViewController()
            navigationController?.pushViewController(viewController, animated: true)
            dismissKeyboard()
        } else if loginTextField.text != data.email || passwordTextField.text != data.password {
            let validEmail = loginTextField.text?.isValidBy(email: loginTextField.text ?? "")
            if !validEmail! {
                loginTextField.shakeField()
            }
            let validPass = passwordTextField.text?.isValidByPassword(passwordTextField.text ?? "")
            if !validPass! {
                passwordTextField.shakeField()
            }
            alert()
        }
    }
    
    @objc private func fieldTapped(_ textField: UITextField) {
        let textCount = textField.text?.count
        if textField.tag == 1 {
            if let count = textCount {
                if count < 5 {
                    if count == 0 {
                        hiddenLabel.isHidden = true
                    } else {
                        hiddenLabel.text = "Your login has less than 5 characters!"
                        textField.textColor = .red
                        hiddenLabel.isHidden = false
                    }
                } else {
                    hiddenLabel.isHidden = true
                    textField.textColor = .black
                }
            }
        } else if textField.tag == 2 {
            if let count = textCount {
                if count < 5 {
                    if count == 0 {
                        hiddenLabel.isHidden = true
                    } else {
                        hiddenLabel.text = "Your password has less than 5 characters!"
                        textField.textColor = .red
                        hiddenLabel.isHidden = false
                    }
                } else {
                    hiddenLabel.isHidden = true
                    textField.textColor = .black
                }
            }
        }
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
        if textField.tag == 1 {
            if let count = textField.text?.count {
                if count < 5 && textField.text != data.email {
                    if count == 0 {
                        hiddenLabel.isHidden = true
                    } else {
                        hiddenLabel.isHidden = false
                        textField.addTarget(self, action: #selector(alert), for: .editingDidEndOnExit)
                        textField.shakeField()
                    }
                } else if loginTextField.text == data.email && passwordTextField.text == data.password {
                    let viewController = ProfileViewController()
                    navigationController?.pushViewController(viewController, animated: true)
                    hiddenLabel.isHidden = true
                    dismissKeyboard()
                }
            }
            textField.addTarget(self, action: #selector(alert), for: .editingDidEndOnExit)
            textField.shakeField()
            let validEmail = loginTextField.text?.isValidBy(email: loginTextField.text ?? "")
            if !validEmail! {
                loginTextField.shakeField()
            }
        } else if textField.tag == 2 {
            if let count = textField.text?.count {
                if count < 5 && textField.text != data.password {
                    if count == 0 {
                        hiddenLabel.isHidden = true
                    } else {
                        hiddenLabel.isHidden = false
                        textField.addTarget(self, action: #selector(alert), for: .editingDidEndOnExit)
                        textField.shakeField()
                    }
                    textField.shakeField()
                } else if passwordTextField.text == data.password && loginTextField.text == data.email {
                    let viewController = ProfileViewController()
                    navigationController?.pushViewController(viewController, animated: true)
                    hiddenLabel.isHidden = true
                    dismissKeyboard()
                }
            }
            textField.addTarget(self, action: #selector(alert), for: .editingDidEndOnExit)
            textField.shakeField()
            let validPass = passwordTextField.text?.isValidByPassword(passwordTextField.text ?? "")
            if !validPass! {
                passwordTextField.shakeField()
            }
        }
        return true
    }
    
    @objc private func alert() {
        let alertController = UIAlertController(title: "Attention!", message: "Wrong login or password. Check the correctness of the entered data.",
                                                preferredStyle: .alert)
        let alertCancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(alertCancelAction)
        present(alertController, animated: true)
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
            
            // hidden label
            hiddenLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            hiddenLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            //log in button
            logInButton.topAnchor.constraint(equalTo: hiddenLabel.bottomAnchor, constant: 16),
            logInButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logInButton.widthAnchor.constraint(equalToConstant: 361),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            
            //separator
            separator.heightAnchor.constraint(equalToConstant: 0.5),
            separator.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 1)
        ])
    }
}

//MARK: - Extensions
extension UITextField {
    func shakeField() {
        let shakeAnimation = CABasicAnimation(keyPath: "position")
        shakeAnimation.duration = 0.05
        shakeAnimation.repeatCount = 6
        shakeAnimation.autoreverses = true
        shakeAnimation.fromValue = CGPoint(x: center.x - 5, y: center.y)
        shakeAnimation.toValue = CGPoint(x: center.x + 5, y: center.y)
        layer.add(shakeAnimation, forKey: "position")
    }
}

extension String {
    func isValidBy(email: String) -> Bool {
        let emailPattern = #"^\S+@\S+\.\S+$"#
        let result = email.range(of: emailPattern, options: .regularExpression)
        let validEmail = (result != nil)
        return validEmail
    }
    
    func isValidByPassword(_ password: String) -> Bool {
        // At least 8 characters
        let passwordPattern = #"(?=.{8,})"# +
        
        // At least one capital letter
        #"(?=.*[A-Z])"# +
        
        // At least one lowercase letter
        #"(?=.*[a-z])"# +
        
        // At least one digit
        #"(?=.*\d)"#
        
        let result = password.range(of: passwordPattern, options: .regularExpression)
        let validPassword = (result != nil)
        return validPassword
    }
}
