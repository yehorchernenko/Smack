//
//  UserDataService.swift
//  Smack
//
//  Created by Egor on 05.05.2018.
//  Copyright © 2018 Chernenko Inc. All rights reserved.
//

import Foundation

class UserDataService{
    
    static let instance = UserDataService()
    
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    private init(){}
    
    func setUserData(id: String,avatarColor: String,avatarName:String, email: String, name: String){
        self.id = id
        self.avatarName = avatarName
        self.avatarColor = avatarColor
        self.name = name
        self.email = email
    }
    
    func setAvatar(name: String){
        self.avatarName = name
    }
}
