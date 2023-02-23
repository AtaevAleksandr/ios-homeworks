//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Aleksandr Ataev on 06.01.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    private var index = 0

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        [authorLabel, descriptionLabel, postImage, likesLabel, viewsLabel].forEach { addSubview($0) }
        setConstraints()
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
        likes.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(addLike)
        )
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        likes.addGestureRecognizer(tapGesture)
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
            likesLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            likesLabel.widthAnchor.constraint(equalToConstant: 150),
            likesLabel.heightAnchor.constraint(equalToConstant: 50),

            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        ])
    }

    func set(with index: Int) {
        self.index = index
        authorLabel.text = Post.posts[index].author
        postImage.image = UIImage(named: Post.posts[index].image)
        descriptionLabel.text = Post.posts[index].description
        likesLabel.text = "Likes: \(Post.posts[index].likes)"
        viewsLabel.text = "Views: \(Post.posts[index].views)"
    }

    @objc func addLike() {
        Post.posts[index].likes += 1
        likesLabel.text = "Likes: \(Post.posts[index].likes)"
    }

}
