//
//  Constants.swift
//  Smack
//
//  Created by Egor on 02.05.2018.
//  Copyright © 2018 Chernenko Inc. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

//URL Constants
let BASE_URL = "https://smackchater.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)/account/register"
let URL_LOGIN = "\(BASE_URL)/account/login"
let URL_USER_ADD = "\(BASE_URL)/user/add"

//Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"

//User Default
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "user_email"

//Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]
