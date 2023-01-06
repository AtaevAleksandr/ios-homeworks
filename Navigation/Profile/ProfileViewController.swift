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
        view.addSubview(profileHeaderView)
        view.addSubview(tableView)
        profileHeaderView.setupSettings()
        setConstraints()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: Cells.myTableViewCell)
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
        static let myTableViewCell = "PostTableViewCell"
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
    private let posts = [
        Post(author: "chrishemsworth",
             description: "Be your own BOSS with the new BOSS Bottled Parfum out now. #BOSSBottled #BeYourOwnBOSS @BOSS",
             image: UIImage(named: "ChrisHemsworth")!,
             likes: "Likes: 906 982",
             views: "Views: 1 540 324"),
        Post(author: "prideofgypsies",
             description: "love you @gueikian and @gibsoncustom for saving me the last greene. @kirkhammett i’m so stoked. @metallica fo life. all my aloha j",
             image: UIImage(named: "JasonMomoa")!,
             likes: "Likes: 405 015",
             views: "Views: 704 234"),
        Post(author: "emilia_clarke",
             description: "When life (or a supporting artist) gives you dragons, you make them make kissy noises.",
             image: UIImage(named: "EmiliaClarke")!,
             likes: "Likes: 1 359 161",
             views: "Views: 1 795 432"),
        Post(author: "therock",
             description: "12am 🕛 🥳 Insanely fun New Years Eve party last night as the clock struck midnight to usher in 2023.",
             image: UIImage(named: "DwayneJohnson")!,
             likes: "Likes: 1 604 914",
             views: "Views: 2 050 543")
    ]
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            //profile header view
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 250),
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),

            //table view list
            tableView.topAnchor.constraint(equalTo: profileHeaderView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.myTableViewCell) as! PostTableViewCell
        let views = posts[indexPath.row]
        cell.set(views: views)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
