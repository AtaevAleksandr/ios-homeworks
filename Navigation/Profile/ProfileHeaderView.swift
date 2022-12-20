//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Aleksandr Ataev on 29.11.2022.
//

import UIKit

final class ProfileHeaderView: UIView {

    //MARK: - Closures
    private var userAvatar: UIImageView = {
        let avatar = UIImageView()
        avatar.image = UIImage(named: "Rock.jpg")
        avatar.contentMode = .scaleAspectFit
        avatar.clipsToBounds = true
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.cornerRadius = 130 / 2
        avatar.translatesAutoresizingMaskIntoConstraints = false
        return avatar
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
        subLabel.textColor = .gray
        subLabel.font = UIFont(name: "Rockwell-Regular", size: 14)
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        return subLabel
    }()

    private lazy var setStatusButton: UIButton = {
        let statusButton = UIButton()
        statusButton.setTitle("Show status", for: .normal)
        statusButton.setTitleColor(.white, for: .normal)
        statusButton.backgroundColor = .systemBlue
        statusButton.layer.cornerRadius = 15
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
        return statusTextField
    }()

    //MARK: - Property
    private var statusText: String = ""

    //MARK: - Methods
    func setupSettings() {
        addSubview(userAvatar)
        addSubview(userNameLabel)
        addSubview(subStatusLabel)
        addSubview(setStatusButton)
        addSubview(setStatusTextField)

        //Constraints
        NSLayoutConstraint.activate([
            //avatar
            userAvatar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            userAvatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            userAvatar.widthAnchor.constraint(equalToConstant: 130),
            userAvatar.heightAnchor.constraint(equalToConstant: 130),

            //name label
            userNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            userNameLabel.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: 10),
            userNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            userNameLabel.heightAnchor.constraint(equalToConstant: 20),

            //sub label
            subStatusLabel.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: 10),
            subStatusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            subStatusLabel.bottomAnchor.constraint(equalTo: setStatusTextField.topAnchor, constant: -16),
            subStatusLabel.heightAnchor.constraint(equalToConstant: 18),

            //text field
            setStatusTextField.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: 10),
            setStatusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -16),
            setStatusTextField.heightAnchor.constraint(equalToConstant: 40),

            //status button
            setStatusButton.topAnchor.constraint(equalTo: userAvatar.bottomAnchor, constant: 60),
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50)

        ])
    }

    @objc private func buttonPressed(_ sender: UIButton) {
        subStatusLabel.text = statusText
        print(subStatusLabel.text ?? "nil")
        setStatusTextField.text = .none
        setStatusTextField.resignFirstResponder()
    }

    @objc private func statusLabelChanged(_ textField: UITextField) {
        textField.becomeFirstResponder()
        if let text = textField.text {
            statusText = text
        }
    }
}
