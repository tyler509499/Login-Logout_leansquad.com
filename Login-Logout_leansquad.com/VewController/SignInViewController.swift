//
//  ViewController.swift
//  Login-Logout_leansquad.com
//
//  Created by Galkov Nikita on 18.02.2021.
//

import UIKit

class SignInViewController: UIViewController {
    
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    let networkManager = NetworkManager()
 
    var checkComplete: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardOnTap(#selector(dismissKeyboard))
        textAndParametersForElements()
    }
//MARK: - label text, placeholder for textfield, button settings
    func textAndParametersForElements() {
        emailLabel.text = "Email"
        passwordLabel.text = "Password"
        emailTextField.placeholder = "Your email"
        passwordTextField.placeholder = "Your password"
        signInButton.layer.cornerRadius = 6
    }
    
 //MARK: - SignInButton Action
    @IBAction func SignInButtonTapped(_ sender: UIButton) {
        checkEmptyFields()
        guard checkComplete == true else {return}
        networkManager.loginRequest(email: emailTextField.text!, password: passwordTextField.text!) {response, error in
            if error != nil {
                self.oneButtonAlert(title: "Bad Request", message: "Try again later or check your Request function")
                return
            }
            if response != nil {
                if AuthorizationModelData.accessToken == nil {
                        self.oneButtonAlert(title: "Wrong email or password", message: "Try again")
                    return
                } else {
                self.performSegue(withIdentifier: "goTabController", sender: nil)
                }
            }
        }
    }
}


