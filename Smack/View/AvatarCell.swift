//
//  AvatarCell.swift
//  Smack
//
//  Created by Egor on 05.05.2018.
//  Copyright © 2018 Chernenko Inc. All rights reserved.
//

import UIKit

enum AvatarType: String {
    case dark = "dark"
    case light = "light"
}

class AvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func configureCell(index: Int, type: AvatarType){
        avatarImageView.image = UIImage(named: "\(type.rawValue)\(index)")
        self.layer.backgroundColor = type == .dark ? UIColor.lightGray.cgColor : UIColor.gray.cgColor
    }
    
    func setupView(){
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
}
