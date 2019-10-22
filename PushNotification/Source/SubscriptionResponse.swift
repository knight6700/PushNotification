//
//  SubscriptionResponse.swift
//  PushBot
//
//  Created by Mahmoud on 10/20/19.
//  Copyright © 2019 Mahmoud Fariss. All rights reserved.
//

import Foundation
struct SubscriptionResponse :Codable{
    let id: String
    let inserted: Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case inserted
    }
}
