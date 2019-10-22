//
//  BaseRequestFactory.swift
//  PushBot
//
//  Created by Mahmoud on 10/20/19.
//  Copyright © 2019 Mahmoud Fariss. All rights reserved.
//

import Foundation
class BaseRequestFactory: NSObject {
    fileprivate var request: BaseRequest?
    convenience init(apiURL: String, httpMethod: RequestHTTPMethod, parameters: [String: Any]? = [:], headers: [String: String]? = [:]) {
        self.init()
        request = BaseRequest()
        request?.url =  apiURL
        request?.httpMethod = httpMethod
        request?.parameters = parameters
        request?.headers = headers
        
    }
    convenience init(url:String) {
        self.init()
        request = BaseRequest()
        request?.httpMethod = .get
        request?.url = url
        
    }
    
    func getRequest() -> BaseRequest {
        return request!
    }
    
}
