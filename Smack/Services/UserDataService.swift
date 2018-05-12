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
    
    func returnUIColor(components: String) -> UIColor{
        let scanner = Scanner(string: components)
        let skipped = CharacterSet(charactersIn: "[], ")
        let comma = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skipped
        
        var r,g,b,a: NSString?
        
        scanner.scanUpToCharacters(from: comma, into: &r)
        scanner.scanUpToCharacters(from: comma, into: &g)
        scanner.scanUpToCharacters(from: comma, into: &b)
        scanner.scanUpToCharacters(from: comma, into: &a)
        
        let defalutColor = UIColor.lightGray
        
        guard let rUnwrapped = r else { return defalutColor }
        guard let gUnwrapped = g else { return defalutColor }
        guard let bUnwrapped = b else { return defalutColor }
        guard let aUnwrapped = a else { return defalutColor }
        
        let rFloat = CGFloat(rUnwrapped.doubleValue)
        let gFloat = CGFloat(gUnwrapped.doubleValue)
        let bFloat = CGFloat(bUnwrapped.doubleValue)
        let aFloat = CGFloat(aUnwrapped.doubleValue)
        
        let newUIColor = UIColor(red: rFloat, green: gFloat, blue: bFloat, alpha: aFloat)
        
        return newUIColor
    }
    
    func logoutUser(){
        self.id = ""
        self.avatarName = ""
        self.avatarColor = ""
        self.name = ""
        self.email = ""
        
        AuthService.instance.isLoggedIn = false
        AuthService.instance.userEmail = ""
        AuthService.instance.authToken = ""
        
        MessageService.instance.clearChannels()
        MessageService.instance.clearMessages()
    }
}
