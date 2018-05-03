//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Egor on 03.05.2018.
//  Copyright © 2018 Chernenko Inc. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBAction func cloaseButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
}
