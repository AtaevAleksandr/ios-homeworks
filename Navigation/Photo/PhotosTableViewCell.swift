//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Aleksandr Ataev on 12.01.2023.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [photoLabel, nextImage, photoStackImageView].forEach { addSubview($0) }
        [photoImageOne, photoImageTwo, photoImageThree, photoImageFour].forEach { photoStackImageView.addArrangedSubview($0) }
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Clousers
    private lazy var photoLabel: UILabel = {
        let label = UILabel()
        label.text = "My friend's photos"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var nextImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "arrow.right")
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var photoStackImageView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var photoImageOne: UIImageView = {
        let photo = UIImageView()
        photo.contentMode = .scaleAspectFill
        photo.layer.cornerRadius = 6
        photo.layer.masksToBounds = true
        photo.clipsToBounds = true
        photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()

    private lazy var photoImageTwo: UIImageView = {
        let photo = UIImageView()
        photo.contentMode = .scaleAspectFill
        photo.layer.cornerRadius = 6
        photo.layer.masksToBounds = true
        photo.clipsToBounds = true
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.frame.size.width = 10
        return photo
    }()

    private lazy var photoImageThree: UIImageView = {
        let photo = UIImageView()
        photo.contentMode = .scaleAspectFill
        photo.layer.cornerRadius = 6
        photo.layer.masksToBounds = true
        photo.clipsToBounds = true
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.frame.size.width = 10
        return photo
    }()

    private lazy var photoImageFour: UIImageView = {
        let photo = UIImageView()
        photo.contentMode = .scaleAspectFill
        photo.layer.cornerRadius = 6
        photo.layer.masksToBounds = true
        photo.clipsToBounds = true
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.frame.size.width = 10
        return photo
    }()

    //MARK: - Methods
    private func setConstraints() {
        NSLayoutConstraint.activate([
            photoLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            photoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            photoLabel.bottomAnchor.constraint(equalTo: photoImageOne.topAnchor, constant: -12),

            nextImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            nextImage.centerYAnchor.constraint(equalTo: photoLabel.centerYAnchor),
            nextImage.heightAnchor.constraint(equalToConstant: 20),
            nextImage.widthAnchor.constraint(equalToConstant: 20),

            photoStackImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            photoStackImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            photoStackImageView.heightAnchor.constraint(equalToConstant: 85),
            photoStackImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
    }

    func set(photos: Photo) {
        photoImageOne.image = UIImage(named: "Thor")
        photoImageTwo.image = UIImage(named: "Aquaman")
        photoImageThree.image = UIImage(named: "Ironman")
        photoImageFour.image = UIImage(named: "Wolverine")
    }
}
