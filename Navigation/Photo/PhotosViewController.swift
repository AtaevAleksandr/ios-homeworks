//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Aleksandr Ataev on 12.01.2023.
//

import UIKit

class PhotosViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        photosCollectionView.delegate = self
        photosCollectionView.dataSource = self
        [photosCollectionView, background, fullScreenImage].forEach { view.addSubview($0) }
        setConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.isHidden = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeImage))
        navigationItem.rightBarButtonItem?.isHidden = true
        navigationController?.tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
        navigationController?.tabBarController?.tabBar.isHidden = false
    }

    struct Cell {
        static let photosCollectionCell = "PhotosCollectionViewCell"
    }

    //MARK: - Clousers
    private lazy var photosCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 32) / 3, height: 95)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: Cell.photosCollectionCell)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    private lazy var background: UIView = {
        let view = UIView(frame: CGRect(x: 0,
                                        y: 0,
                                        width: UIScreen.main.bounds.width,
                                        height: UIScreen.main.bounds.height))
        view.backgroundColor = .darkGray
        view.isHidden = true
        view.alpha = 0
        return view
    }()

    private lazy var fullScreenImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.alpha = 0
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    //MARK: - Propeties
    private let photos = Photo.photos

    //MARK: - Methods
    private func setConstraints() {
        NSLayoutConstraint.activate([
            photosCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            photosCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photosCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            photosCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            fullScreenImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            fullScreenImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            fullScreenImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fullScreenImage.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.photosCollectionCell, for: indexPath) as! PhotosCollectionViewCell
        let photos = photos[indexPath.item]
        item.set(photos: photos)
        return item
    }

    @objc func closeImage(){
        navigationItem.rightBarButtonItem?.isHidden = true
        UIView.animate(withDuration: 0.4) { [self] in
            fullScreenImage.alpha = 0
            background.isHidden = true
            background.alpha = 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photos = photos[indexPath.item].image
        fullScreenImage.image = UIImage(named: photos)
        UIView.animate(withDuration: 0.7) { [self] in
            fullScreenImage.alpha = 1
            background.isHidden = false
            background.alpha = 0.9
        } completion: { _ in
            UIView.animate(withDuration: 0.7) { [self] in
                navigationItem.rightBarButtonItem?.isHidden = false
            }
        }
    }
}
