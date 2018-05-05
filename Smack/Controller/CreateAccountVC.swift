//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Egor on 03.05.2018.
//  Copyright © 2018 Chernenko Inc. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userImageView: UIImageView!
    
    
    @IBAction func chooseAvatarButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func generateBGColorButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func createAccountButtonPressed(_ sender: UIButton) {
        guard let email = emailTextField.text, email != "" else { return }
        guard let pass = passwordTextField.text, pass != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: pass) { success in
            if success{
                print("User registered!")
            }
        }
    }
    
    @IBAction func cloaseButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
}
