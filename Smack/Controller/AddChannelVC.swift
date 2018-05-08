//
//  AddChannelVC.swift
//  Smack
//
//  Created by Egor on 08.05.2018.
//  Copyright © 2018 Chernenko Inc. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var nameChannelTextField: UITextField!
    @IBOutlet weak var channelDescriptionTextField: UITextField!
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createButtonPressed(_ sender: UIButton) {
        guard let channelName = nameChannelTextField.text, channelName != "" else { return }
        guard let channelDesc = channelDescriptionTextField.text, channelDesc != "" else { return }
        
        SocketService.instance.addChannel(withName: channelName, description: channelDesc) { success in
            if success {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func setupView(){
        nameChannelTextField.attributedPlaceholder =  NSAttributedString(string: "name", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceholder])
        channelDescriptionTextField.attributedPlaceholder =  NSAttributedString(string: "description", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceholder])
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }
    
    
}
