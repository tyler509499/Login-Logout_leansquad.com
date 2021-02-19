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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textAndParametersForElements()
    }

    func textAndParametersForElements() {
        emailLabel.text = "Email"
        passwordLabel.text = "Password"
        emailTextField.placeholder = "Your email"
        passwordTextField.placeholder = "Your password"
        signInButton.layer.cornerRadius = 6
        
        emailTextField.text = "junior-ios-developer@mailinator.com"
        passwordTextField.text = "s4m8AJDbVvX4H8aF"

    }
    
    
    @IBAction func SignInButtonTapped(_ sender: UIButton) {
        networkManager.loginRequest(email: emailTextField.text!, password: passwordTextField.text!) {response, error in
            if error != nil {
                self.oneButtonAlert(title: "Bad Request", message: "Try again later or check your Request function")
                return
            }
            if response != nil {
                print(AuthorizationModelData.accessToken!)
                self.performSegue(withIdentifier: "goBooking", sender: nil)
            }
            
        }
    }
    

}

