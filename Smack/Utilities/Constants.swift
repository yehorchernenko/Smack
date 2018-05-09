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
let URL_USER_BY_EMAIL = "\(BASE_URL)user/byEmail/"
let URL_GET_CHANNELS = "\(BASE_URL)/channel/"
let URL_GET_MESSAGES = "\(BASE_URL)/message/byChannel"

//Colors
let smackPurplePlaceholder = UIColor.purple

//Notification
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name(rawValue: "notificationUserDataChanged")
let NOTIF_CHANNELS_LOADED = Notification.Name(rawValue: "notificationChannelLoadded")
let NOTIF_CHANNEL_SELECTED = Notification.Name(rawValue: "notificationChannelSelected")

//Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let TO_AVATAR_PICKER = "toAvatarPicker"
let UNWIND = "unwindToChannel"

//User Default
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "user_email"

//Headers
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]

let BEARER_HEADER = [
    "Authorization": "Bearer \(AuthService.instance.authToken)",
    "Content-Type": "application/json; charset=utf-8"
]
