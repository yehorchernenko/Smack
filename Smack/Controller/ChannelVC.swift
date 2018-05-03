//
//  ChannelVC.swift
//  Smack
//
//  Created by Egor on 02.05.2018.
//  Copyright © 2018 Chernenko Inc. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func preapreForUnwind(segue: UIStoryboardSegue){}

    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    
}
