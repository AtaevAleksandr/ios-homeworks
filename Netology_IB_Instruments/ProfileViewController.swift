//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by Aleksandr Ataev on 21.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private var myView: ProfileView!

    override func viewDidLoad() {
        super.viewDidLoad()

        myView = Bundle.main.loadNibNamed("ProfileView", owner: nil)?.first as? ProfileView

        view.addSubview(myView)
    }
}
