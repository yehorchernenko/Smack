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
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var avatarName = "smackProfileIcon"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var bgColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @objc func handleTap(){
        view.endEditing(true)
    }
    
    @IBAction func chooseAvatarButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != ""{
            userImageView.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
            
            if avatarName.contains(AvatarType.light.rawValue) && bgColor == nil{
                userImageView.backgroundColor = UIColor.lightGray
            }
        }
        
    }
    
    @IBAction func generateBGColorButtonPressed(_ sender: UIButton) {
        let r = CGFloat(arc4random_uniform(255)) / 255.0
        let g = CGFloat(arc4random_uniform(255)) / 255.0
        let b = CGFloat(arc4random_uniform(255)) / 255.0
        
        UIView.animate(withDuration: 0.3) {
            self.bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        }
        
        self.userImageView.backgroundColor = bgColor
    }
    
    @IBAction func createAccountButtonPressed(_ sender: UIButton) {
        spinner.isHidden = false
        spinner.startAnimating()
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
                                self.spinner.isHidden = true
                                self.spinner.stopAnimating()
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                            }
                        })
                    }
                })
            }
        }
    }
    
    func setupView(){
        spinner.isHidden = true
        usernameTextField.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceholder])
        emailTextField.attributedPlaceholder =  NSAttributedString(string: "email", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceholder])
        passwordTextField.attributedPlaceholder =  NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceholder])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func cloaseButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
}
