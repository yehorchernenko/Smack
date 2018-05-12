//
//  MessageCell.swift
//  Smack
//
//  Created by Egor on 12.05.2018.
//  Copyright © 2018 Chernenko Inc. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var userImageView: CircleImage!
    @IBOutlet weak var messageBodyLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(message: Message){
        messageBodyLabel.text = message.message
        userNameLabel.text = message.userName
        userImageView.image = UIImage(named: message.userAvatar)
        userImageView.backgroundColor = UserDataService.instance.returnUIColor(components: message.userAvatarColor)
    }
}
