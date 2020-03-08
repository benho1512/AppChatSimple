//
//  LoginViewController.swift
//  AppChatSimple
//
//  Created by Nguyen Duy anh on 3/7/20.
//  Copyright © 2020 Nguyen Duy anh. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editElement()
    }
    
    
    func validateField() -> String? {
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {}
        
        return nil
    }
    
    func editElement() {
        errorLabel.alpha = 0 
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
    }
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        errorLabel.alpha = 0
        guard let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else { fatalError() }
        guard let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else { fatalError() }
        Auth.auth().signIn(withEmail: email, password: password) { (results, error) in
            if let err = error {
                print(err)
                self.showError("email or password is not valid")
            } else {
                self.transitionFromHome()
            }
        }
    }
    
    
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionFromHome() {
        performSegue(withIdentifier: Constants.loginSegue, sender: self)
    }
}
