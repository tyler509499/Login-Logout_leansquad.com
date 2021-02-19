//
//  SettingsViewController.swift
//  Login-Logout_leansquad.com
//
//  Created by Galkov Nikita on 18.02.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var logOutButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
//MARK: - LogOut Button Action
    @IBAction func logOutButtonTapped(_ sender: Any) {
        AuthorizationModelData.accessToken = nil
        self.performSegue(withIdentifier: "goSignIn", sender: nil)
    
    }
    

}
