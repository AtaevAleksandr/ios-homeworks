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
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: Identifiers.postCell)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: Identifiers.photoCell)
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: Identifiers.headerID)
        view.addSubview(tableView)
        setConstraints()
    }
    
    struct Identifiers {
        static let postCell = "PostTableViewCell"
        static let photoCell = "PhotoTableViewCell"
        static let headerID = "ProfileHeaderView"
    }
    
    //MARK: - Clousers
    private lazy var tableView: UITableView = {
        let tableViewList = UITableView(frame: .zero, style: .grouped)
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
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
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
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.photoCell) as! PhotosTableViewCell
            let photos = photos[indexPath.row]
            cell.set(photos: photos)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.postCell) as! PostTableViewCell
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 0 else { return nil }
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: Identifiers.headerID)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard section == 0 else { return 0 }
        return 250
    }
}
