//
//  UIViewCintroller+alert.swift
//  Login-Logout_leansquad.com
//
//  Created by Galkov Nikita on 18.02.2021.
//

import Foundation
import UIKit

//MARK: - Alert for failure request
extension SignInViewController {

    func oneButtonAlert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

//MARK: - Hide keyboard by tap
extension SignInViewController {
    
    func hideKeyboardOnTap(_ selector: Selector) {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: selector)
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension SignInViewController {
//MARK: - Check textfields for empty
    func checkEmptyFields() {
        if emailTextField.text == "" || emailTextField.text == nil {
            checkComplete = false
            let alert = UIAlertController(title: "Empty Email Field", message: "Enter your email", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction!) in
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25){
                                                self.emailTextField.becomeFirstResponder()
                                            }})
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        } else {
            checkComplete = true
            
        }
        if passwordTextField.text == "" || passwordTextField.text == nil{
            checkComplete = false
            let alert = UIAlertController(title: "Empty Password Field", message: "Enter your password", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction!) in
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25){
                                                self.passwordTextField.becomeFirstResponder()
                                            }})
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            return
        } else {
            checkComplete = true
        }
    }
}

