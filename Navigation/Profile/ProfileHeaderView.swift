//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Aleksandr Ataev on 29.11.2022.
//

import UIKit

final class ProfileHeaderView: UITableViewHeaderFooterView {

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupSettings()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Properties
    private var statusText: String = ""
    private var userAvatarStartPoint = CGPoint()

    //MARK: - Closures
    private lazy var userAvatar: UIImageView = {
        let avatar = UIImageView()
        avatar.image = UIImage(named: "Rock.jpg")
        avatar.contentMode = .scaleAspectFit
        avatar.clipsToBounds = true
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.cornerRadius = 130 / 2
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatarGestureSettings(imageView: avatar)
        return avatar
    }()

    private lazy var userAvatarBackrgound: UIView = {
        let background = UIView(frame: CGRect(x: 0,
                                              y: 0,
                                              width: UIScreen.main.bounds.width,
                                              height: UIScreen.main.bounds.height))
        background.backgroundColor = .darkGray
        background.isHidden = true
        background.alpha = 0
        return background
    }()

    private lazy var backButtonOnBackgroundView: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.alpha = 0
        button.contentMode = .scaleToFill
        button.setImage(UIImage(systemName: "xmark", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25)
                               )?.withTintColor(.black, renderingMode: .automatic), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let userNameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Serious Rock"
        nameLabel.textColor = .black
        nameLabel.font = UIFont(name: "Rockwell-Bold", size: 18)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    private let subStatusLabel: UILabel = {
        let subLabel = UILabel()
        subLabel.text = "Waiting for something..."
        subLabel.textColor = .systemGray2
        subLabel.font = UIFont(name: "Rockwell-Regular", size: 14)
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        return subLabel
    }()
    
    lazy var setStatusButton: UIButton = {
        let statusButton = UIButton()
        statusButton.configuration = .filled()
        statusButton.configuration?.baseBackgroundColor = .systemBlue
        statusButton.configuration?.cornerStyle = .large
        statusButton.configuration?.title = "Show status"
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowOpacity = 0.7
        statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        return statusButton
    }()
    
    private lazy var setStatusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.backgroundColor = .white
        statusTextField.placeholder = "Write here..."
        statusTextField.textColor = .black
        statusTextField.font = UIFont(name: "Rockwell-Regular", size: 15)
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: statusTextField.frame.height))
        statusTextField.leftViewMode = .always
        statusTextField.addTarget(self, action: #selector(statusLabelChanged), for: .editingChanged)
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        setKeyboardSettings(forUITextField: statusTextField)
        return statusTextField
    }()
    
    //MARK: - Methods
    func setupSettings() {
        [userNameLabel, subStatusLabel, setStatusTextField, setStatusButton,
         userAvatarBackrgound, userAvatar, backButtonOnBackgroundView].forEach { contentView.addSubview($0) }

        NSLayoutConstraint.activate([
            userAvatar.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 16),
            userAvatar.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            userAvatar.widthAnchor.constraint(equalToConstant: 130),
            userAvatar.heightAnchor.constraint(equalToConstant: 130),

            userNameLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 27),
            userNameLabel.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: 10),
            userNameLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            userNameLabel.heightAnchor.constraint(equalToConstant: 20),

            subStatusLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 40),
            subStatusLabel.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: 10),
            subStatusLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            subStatusLabel.bottomAnchor.constraint(equalTo: setStatusTextField.topAnchor, constant: -16),
            subStatusLabel.heightAnchor.constraint(equalToConstant: 18),

            setStatusTextField.topAnchor.constraint(equalTo: subStatusLabel.bottomAnchor, constant: 16),
            setStatusTextField.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: 10),
            setStatusTextField.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            setStatusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -16),
            setStatusTextField.heightAnchor.constraint(equalToConstant: 40),

            setStatusButton.topAnchor.constraint(equalTo: setStatusTextField.bottomAnchor, constant: 20),
            setStatusButton.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),

            backButtonOnBackgroundView.topAnchor.constraint(equalTo: topAnchor),
            backButtonOnBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    @objc private func buttonPressed() {
        subStatusLabel.text = statusText
        setStatusTextField.text = nil
        dismissKeyboard()
    }
    
    @objc private func statusLabelChanged(_ textField: UITextField) {
        if let text = textField.text {
            statusText = text
        }
    }
}

//MARK: - Extensions
extension ProfileHeaderView {
    private func avatarGestureSettings(imageView: UIImageView) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(avatarTapped))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGesture)
    }

    @objc private func avatarTapped() {
        userAvatar.isUserInteractionEnabled = false
        userAvatarStartPoint = userAvatar.center
        let scale = UIScreen.main.bounds.width / userAvatar.bounds.width
        UIView.animate(withDuration: 0.5) {
            self.userAvatar.center = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY - self.userAvatarStartPoint.y)
            self.userAvatar.transform = CGAffineTransform(scaleX: scale, y: scale)
            self.userAvatar.layer.cornerRadius = 0
            self.userAvatarBackrgound.isHidden = false
            self.userAvatarBackrgound.alpha = 0.8
        } completion: { _ in
            UIView.animate(withDuration: 0.5) {
                self.backButtonOnBackgroundView.alpha = 1
            }
        }
    }

    @objc private func backButtonTapped() {
        userAvatar.isUserInteractionEnabled = true
        UIView.animate(withDuration: 0.3) {
            self.backButtonOnBackgroundView.alpha = 0
            self.userAvatar.center = self.userAvatarStartPoint
            self.userAvatar.transform = CGAffineTransform.identity
            self.userAvatar.layer.cornerRadius = self.userAvatar.frame.height / 2
            self.userAvatarBackrgound.alpha = 0
        }
    }
}

extension ProfileHeaderView: UITextFieldDelegate {
    private func setKeyboardSettings(forUITextField textField: UITextField) {
        textField.delegate = self
        textField.autocorrectionType = .no
        textField.returnKeyType = .done
        textField.enablesReturnKeyAutomatically = true
        let tapOnView = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        addGestureRecognizer(tapOnView)
    }

    @objc private func dismissKeyboard() {
        endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        subStatusLabel.text = statusText
        setStatusTextField.text = nil
        dismissKeyboard()
        return true
    }
}
