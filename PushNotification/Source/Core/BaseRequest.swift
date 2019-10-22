//
//  BaseRequest.swift
//  PushBot
//
//  Created by Mahmoud on 10/20/19.
//  Copyright © 2019 Mahmoud Fariss. All rights reserved.
//

import Foundation

/**
 Request supported http method.
 - get: Get Method.
 - post: Post Method.
 - delete: Delete Method.
 - put: Put Method.
 */
enum RequestHTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "Delete"
    case put = "PUT"
}

class BaseRequest: NSObject {
    /**
     VFBaseRequest is the parent for any request, provides the basic objects for any request such as url, headers, httpMethod ...etc
     */
    // The request url
    var baseUrl: String = ""
    // api name
    var apiName: String = ""
    // url/api name
    var url: String = ""
    // The request parameters
    var parameters: [String: Any]?
    // The request headers
    var headers: [String: String]?
    // query params
    var queryParams: [String: Any]?
    // The request httpMethod
    var httpMethod: RequestHTTPMethod = .get
    // The response type
    // An identifier used to differentiate different requests
    var identifier: String = ""
    // class type of request
    var classType: AnyClass?
    // number of retry request
    var retry: Int?
    // time out of request
    var timeOut: TimeInterval?
    /**
     Initializing a new VFBaseRequest.
     */
    override init() {
        parameters = [:]
        queryParams = [:]
        headers = [:]
        timeOut = 30
        retry = 0
    }
    
}
