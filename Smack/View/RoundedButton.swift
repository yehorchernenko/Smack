//
//  RoundedButton.swift
//  Smack
//
//  Created by Egor on 05.05.2018.
//  Copyright © 2018 Chernenko Inc. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {
    
    @IBInspectable
    var cornerRadius: CGFloat = 3.0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }

    override func awakeFromNib() {
        self.setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    func setupView(){
       self.layer.cornerRadius = cornerRadius
    }
}
