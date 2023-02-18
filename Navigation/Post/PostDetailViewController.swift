//
//  PostDetailViewController.swift
//  Navigation
//
//  Created by Aleksandr Ataev on 17.02.2023.
//

import UIKit

final class PostDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(contentView)
        [authorLabel, descriptionLabel, postImage, likesLabel, viewsLabel].forEach { view.addSubview($0) }
        setConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.isHidden = false
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    //MARK: - Properties
    var post: Post!

    //MARK: - Clousers
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .systemGray6
        return contentView
    }()

    lazy var authorLabel: UILabel = {
        let author = UILabel()
        author.numberOfLines = 2
        author.font = .boldSystemFont(ofSize: 20)
        author.textColor = .black
        author.translatesAutoresizingMaskIntoConstraints = false
        author.text = post.author
        return author
    }()

    lazy var descriptionLabel: UILabel = {
        let description = UILabel()
        description.numberOfLines = 0
        description.font = .systemFont(ofSize: 16)
        description.textColor = .systemGray
        description.translatesAutoresizingMaskIntoConstraints = false
        description.text = "\(post.author): \(post.description)"
        return description
    }()

    lazy var postImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: post.image)
        image.layer.cornerRadius = 15

        return image
    }()

    lazy var likesLabel: UILabel = {
        let likes = UILabel()
        likes.font = .systemFont(ofSize: 16)
        likes.textColor = .black
        likes.textAlignment = .left
        likes.translatesAutoresizingMaskIntoConstraints = false
        likes.text = "Likes: \(post.likes)"
        return likes
    }()

    lazy var viewsLabel: UILabel = {
        let views = UILabel()
        views.font = .systemFont(ofSize: 16)
        views.textColor = .black
        views.textAlignment = .right
        views.translatesAutoresizingMaskIntoConstraints = false
        views.text = "Views: \(post.views)"
        return views
    }()

    //MARK: - Methods
    func setConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            postImage.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 16),
            postImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            postImage.heightAnchor.constraint(equalTo: contentView.widthAnchor),

            descriptionLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),

            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
}
