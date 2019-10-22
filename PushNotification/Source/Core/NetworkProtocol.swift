//
//  NetworkProtocol.swift
//  PushBot
//
//  Created by Mahmoud on 10/20/19.
//  Copyright © 2019 Mahmoud Fariss. All rights reserved.
//

import Foundation
protocol NetworkProtocol {
    func executeRequest<T:Codable>(_ baseRequest:BaseRequest ,successHandler: @escaping ((T) -> Void) , faluire: @escaping ((BaseError) -> Void))
}
