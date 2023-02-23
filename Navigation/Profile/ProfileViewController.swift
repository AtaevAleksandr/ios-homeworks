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
        view.addSubview(tableView)
        navigationItem.hidesBackButton = true
        setConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
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
        tableViewList.register(PostTableViewCell.self, forCellReuseIdentifier: Identifiers.postCell)
        tableViewList.register(PhotosTableViewCell.self, forCellReuseIdentifier: Identifiers.photoCell)
        tableViewList.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: Identifiers.headerID)
        tableViewList.dataSource = self
        tableViewList.delegate = self
        return tableViewList
    }()
    
    //MARK: - Properties
    private var posts = Post.posts
    private var photos = Photo.photos
    private var photoTitle = Title(title: "Photo Gallery")
    private var postTitle = Title(title: "Post Detail")
    
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
            cell.set(with: indexPath.row)
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
            let newViewController = PostDetailViewController()
            newViewController.title = postTitle.title
            Post.posts[indexPath.row].views += 1
            newViewController.post = Post.posts[indexPath.row]
            navigationController?.pushViewController(newViewController, animated: true)
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

    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            if indexPath.section == 1 {
                self.posts.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
