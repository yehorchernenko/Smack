//
//  ChannelCell.swift
//  Smack
//
//  Created by Egor on 08.05.2018.
//  Copyright © 2018 Chernenko Inc. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {

   
    @IBOutlet weak var channelNameLabel: UILabel!
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.2).cgColor
        } else {
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    func configureCell(channel: Channel){
        let title = "#\(channel.channelTitle ?? "")"
        channelNameLabel.text = title
        channelNameLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
        
        for id in MessageService.instance.unreadChannels{
            if id == channel.id{
                channelNameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 22)
            }
        }
    }
}
