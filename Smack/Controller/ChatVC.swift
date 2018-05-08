//
//  ChatVC.swift
//  Smack
//
//  Created by Egor on 02.05.2018.
//  Copyright © 2018 Chernenko Inc. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var menuBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        if AuthService.instance.isLoggedIn{
            AuthService.instance.findUserByEmail(completion: {  success in
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
            })
        }
    }
}
