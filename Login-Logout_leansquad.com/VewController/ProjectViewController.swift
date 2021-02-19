//
//  ProjectViewController.swift
//  Login-Logout_leansquad.com
//
//  Created by Galkov Nikita on 18.02.2021.
//

import UIKit

class ProjectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//MARK: - Print just for chect that AccessToken is OK
        print(AuthorizationModelData.accessToken!)
    }
}
