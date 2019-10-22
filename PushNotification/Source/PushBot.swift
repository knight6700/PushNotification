//
//  PushBot.swift
//  PushBot
//
//  Created by Mahmoud on 10/20/19.
//  Copyright © 2019 Mahmoud Fariss. All rights reserved.
//

import Foundation
public class PushBot{
    public static let shared = PushBot()
    private init() {}
    
    public func setDeviceToken(_ deviceToken: Data){
        let request = BaseRequestFactory(apiURL: subscribationAPI
            , httpMethod: .post
            , parameters: ["platform":0,"token":deviceToken]
            , headers: ["Content-Type":"application/json","x-pushbots-appid":pushBotKey])
            .getRequest()
        
        let dataPolicy = PushBotDataPolicy()
        
        getData(request, dataPolicy, successHandler:{(value:SubscriptionResponse) in
            
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    public func handleNotification (_ userInfo: [AnyHashable: Any]){
        
    }
    
    
}
