//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Aleksandr Ataev on 25.11.2022.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray3
        navigationItem.title = "Profile"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: Cells.postCell)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: Cells.photoCell)
        view.addSubview(tableView)
        view.addSubview(profileHeaderView)
        profileHeaderView.setupSettings()
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    struct Cells {
        static let postCell = "PostTableViewCell"
        static let photoCell = "PhotoTableViewCell"
    }
    
    //MARK: - Clousers
    private lazy var profileHeaderView: ProfileHeaderView = {
        let profileView = ProfileHeaderView()
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileView.backgroundColor = .systemGray3
        return profileView
    }()
    
    private lazy var tableView: UITableView = {
        let tableViewList = UITableView()
        tableViewList.rowHeight = UITableView.automaticDimension
        tableViewList.translatesAutoresizingMaskIntoConstraints = false
        return tableViewList
    }()
    
    //MARK: - Properties
    private let posts = Post.posts
    private let photos = Photo.photos
    private var photoTitle = Title(title: "Photo Gallery")
    
    //MARK: - Methods
    private func setConstraints() {
        NSLayoutConstraint.activate([
            //profile header view
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 300),
            profileHeaderView.topAnchor.constraint(equalTo: view.topAnchor),
            
            //table view list
            tableView.topAnchor.constraint(equalTo: profileHeaderView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

//MARK: - Extensions
extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return posts.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: Cells.photoCell) as! PhotosTableViewCell
            let photos = photos[indexPath.row]
            cell.set(photos: photos)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: Cells.postCell) as! PostTableViewCell
            let views = posts[indexPath.row]
            cell.set(views: views)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            let newViewController = PhotosViewController()
            newViewController.title = photoTitle.title
            tableView.deselectRow(at: indexPath, animated: true)
            navigationController?.pushViewController(newViewController, animated: true)
        default:
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
