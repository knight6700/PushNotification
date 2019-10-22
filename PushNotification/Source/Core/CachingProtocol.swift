//
//  CachingProtocol.swift
//  PushBot
//
//  Created by Mahmoud on 10/20/19.
//  Copyright © 2019 Mahmoud Fariss. All rights reserved.
//

import Foundation
protocol CachingProtocol {
    func getData<T>(_ key: String) -> T?
    func deleteItem(_ key: String) -> Bool
    func deleteAll()
    func save<T> (_ key:String , object:T)
}
