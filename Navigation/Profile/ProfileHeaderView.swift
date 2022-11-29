//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Aleksandr Ataev on 29.11.2022.
//

import UIKit

final class ProfileHeaderView: UIView {

    //MARK: - Properties
    private let avatar = UIImageView()
    private let statusButton = UIButton()
    private let nameLabel = UILabel()
    private let subLabel = UILabel()
    private let statusTextField = UITextField()
    private var statusText: String = ""

    //MARK: - Methods
    func setupSettings() {

        //Avatar
        addSubview(avatar)
        avatar.image = UIImage(named: "Rock.jpg")
        avatar.contentMode = .scaleAspectFit
        avatar.clipsToBounds = true
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.cornerRadius = 130 / 2
        avatar.translatesAutoresizingMaskIntoConstraints = false

        //Name Label
        addSubview(nameLabel)
        nameLabel.text = "Serious Rock"
        nameLabel.textColor = .black
        nameLabel.font = UIFont(name: "Rockwell-Bold", size: 18)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        //Sub Label
        addSubview(subLabel)
        subLabel.text = "Waiting for something..."
        subLabel.textColor = .gray
        subLabel.font = UIFont(name: "Rockwell-Regular", size: 14)
        subLabel.translatesAutoresizingMaskIntoConstraints = false

        //Status Button
        addSubview(statusButton)
        statusButton.setTitle("Show status", for: .normal)
        statusButton.setTitleColor(.white, for: .normal)
        statusButton.backgroundColor = .systemBlue
        statusButton.layer.cornerRadius = 15
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowOpacity = 0.7
        statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        // По какой-то причине 3 раза выводит в консоль информацию по нажатию... не понял почему
        //        statusButton.addAction(.init(handler: { _ in
        //            print(self.subLabel.text ?? "Error")
        //        }), for: .touchUpInside)
        statusButton.translatesAutoresizingMaskIntoConstraints = false

        //Text Field
        addSubview(statusTextField)
        statusTextField.backgroundColor = .white
        statusTextField.placeholder = "Write here..."
        statusTextField.textColor = .black
        statusTextField.font = UIFont(name: "Rockwell-Regular", size: 15)
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: statusTextField.frame.height))
        statusTextField.leftViewMode = .always
        statusTextField.addTarget(self, action: #selector(statusTextFieldChanged), for: .editingChanged)
        statusTextField.translatesAutoresizingMaskIntoConstraints = false


        //Constraints
        NSLayoutConstraint.activate([
            //avatar
            avatar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatar.widthAnchor.constraint(equalToConstant: 130),
            avatar.heightAnchor.constraint(equalToConstant: 130),

            //name label
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            nameLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),

            //sub label
            subLabel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 10),
            subLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            subLabel.bottomAnchor.constraint(equalTo: statusTextField.topAnchor, constant: -16),
            subLabel.heightAnchor.constraint(equalToConstant: 18),

            //text field
            statusTextField.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 10),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusTextField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),

            //status button
            statusButton.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 60),
            statusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusButton.heightAnchor.constraint(equalToConstant: 50)

        ])
    }

    @objc func buttonPressed(_ sender: UIButton) {
        if let text = statusTextField.text {
            statusText = text
        }
        subLabel.text = statusText
        statusTextField.resignFirstResponder()
    }

    @objc func statusTextFieldChanged(_ textField: UITextField) {
        statusTextField.becomeFirstResponder()
        print("was ended from target")
    }
}




