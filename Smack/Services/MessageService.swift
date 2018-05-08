//
//  MessageService.swift
//  Smack
//
//  Created by Egor on 08.05.2018.
//  Copyright © 2018 Chernenko Inc. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService{
    
    static let instance = MessageService()
    
    private init () {}
    
    var channels = [Channel]()
    
    func findAllChannel(completion: @escaping CompletionHandler){
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { response in
            if response.result.error == nil{
                guard let data = response.data else { return }
                guard let jsonArray = try? JSON(data: data).arrayValue else { return }
                
                for item in jsonArray{
                    let name = item["name"].stringValue
                    let channelDesc = item["description"].stringValue
                    let id = item["_id"].stringValue
                    
                    let channel = Channel(channelTitle: name, channelDescription: channelDesc, id: id)
                    self.channels.append(channel)
                }
                
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
