//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Aleksandr Ataev on 15.01.2023.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Clousers
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Thor")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    //MARK: - Methods
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func set(photos: Photo) {
        imageView.image = UIImage(named: photos.image)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
    }
}
