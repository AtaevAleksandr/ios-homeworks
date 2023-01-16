//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Aleksandr Ataev on 06.01.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(authorLabel)
        addSubview(descriptionLabel)
        addSubview(postImage)
        addSubview(likesLabel)
        addSubview(viewsLabel)
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Clousers
    lazy var authorLabel: UILabel = {
        let author = UILabel()
        author.numberOfLines = 2
        author.font = .boldSystemFont(ofSize: 20)
        author.textColor = .black
        author.translatesAutoresizingMaskIntoConstraints = false
        return author
    }()

    lazy var descriptionLabel: UILabel = {
        let description = UILabel()
        description.numberOfLines = 0
        description.font = .systemFont(ofSize: 14)
        description.textColor = .systemGray
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()

    lazy var postImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    lazy var likesLabel: UILabel = {
        let likes = UILabel()
        likes.font = .systemFont(ofSize: 16)
        likes.textColor = .black
        likes.textAlignment = .left
        likes.translatesAutoresizingMaskIntoConstraints = false
        return likes
    }()

    lazy var viewsLabel: UILabel = {
        let views = UILabel()
        views.font = .systemFont(ofSize: 16)
        views.textColor = .black
        views.textAlignment = .right
        views.translatesAutoresizingMaskIntoConstraints = false
        return views
    }()

    //MARK: - Methods
    func setConstraints() {
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            authorLabel.bottomAnchor.constraint(equalTo: postImage.topAnchor, constant: -12),

            postImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            postImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            postImage.heightAnchor.constraint(equalTo: widthAnchor),

            descriptionLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            likesLabel.trailingAnchor.constraint(equalTo: viewsLabel.leadingAnchor),
            likesLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),

            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        ])
    }

    func set(views: Post) {
        authorLabel.text = views.author
        postImage.image = UIImage(named: views.image)
        descriptionLabel.text = views.description
        likesLabel.text = "Likes: \(views.likes)"
        viewsLabel.text = "Views: \(views.views)"
    }

}
