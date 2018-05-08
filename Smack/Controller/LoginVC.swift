//
//  LoginVC.swift
//  Smack
//
//  Created by Egor on 02.05.2018.
//  Copyright © 2018 Chernenko Inc. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    func setupView(){
        spinner.isHidden = true
        emailTextField.attributedPlaceholder =  NSAttributedString(string: "email", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceholder])
        passwordTextField.attributedPlaceholder =  NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceholder])
        
    }
    
    @IBAction func logineButtonPressed(_ sender: UIButton) {
        spinner.isHidden = false
        spinner.startAnimating()
        
        guard let email = emailTextField.text, email != "" else { return }
        guard let pass = passwordTextField.text, pass != "" else { return }
        
        AuthService.instance.loginUser(email: email, password: pass) { success in
            if success {
                AuthService.instance.findUserByEmail(completion: { success in
                    NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                    self.spinner.stopAnimating()
                    self.spinner.isHidden = true
                    self.dismiss(animated: true, completion: nil)
                })
            }
        }
    }
    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
}
