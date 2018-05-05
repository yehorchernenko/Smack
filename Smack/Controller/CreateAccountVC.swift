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
    
    var avatarName = "smackProfileIcon"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    @IBAction func chooseAvatarButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func generateBGColorButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func createAccountButtonPressed(_ sender: UIButton) {
        guard let name = usernameTextField.text, name != "" else { return }
        guard let email = emailTextField.text, email != "" else { return }
        guard let pass = passwordTextField.text, pass != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: pass) { success in
            if success{
                print("User registered")
                
                AuthService.instance.loginUser(email: email, password: pass, completion: { success in
                    
                    if success{
                        print("User loggedIn")
                        
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { success in
                            
                            if success{
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                            }
                        })
                    }
                })
            }
        }
    }
    
    @IBAction func cloaseButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
}
