//
//  GradientView.swift
//  Smack
//
//  Created by Egor on 02.05.2018.
//  Copyright © 2018 Chernenko Inc. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {

    @IBInspectable
    var topColor: UIColor = .blue {
        didSet{
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable
    var bottomColor: UIColor = .green {
        didSet{
            self.setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        let gradienLayer = CAGradientLayer()
        gradienLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradienLayer.startPoint = CGPoint(x: 0, y: 0)
        gradienLayer.endPoint = CGPoint(x: 1, y: 1)
        gradienLayer.frame = self.bounds
        self.layer.insertSublayer(gradienLayer, at: 0)
        
    }
}
