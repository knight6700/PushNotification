//
//  BaseError.swift
//  PushBot
//
//  Created by Mahmoud on 10/20/19.
//  Copyright © 2019 Mahmoud Fariss. All rights reserved.
//

import Foundation
let errorAPINameKey: String = "ErrorAPINameKey"

enum LocalError: Int {
    case dataConnectionFailed = 1
    case notConnectedToInternet
    case timedOut
    case unknownNetworkError
    case emptyResponse
    case mimeType
    case parsing
    case badURL
}

struct BaseError: Error, Codable {
    let code: Int
    let message: String
    let api: String?
    
    init(code: Int, message: String, api: String?) {
        self.code = code
        self.message = message
        self.api = api
    }
    init(error: Error) {
        if let error = error as? URLError {
            switch error.code {
            case .networkConnectionLost:
                self.init(code: LocalError.dataConnectionFailed.rawValue, message: error.localizedDescription,
                          api: error.userInfo[errorAPINameKey] as? String)
            case .notConnectedToInternet:
                self.init(code: LocalError.notConnectedToInternet.rawValue, message: error.localizedDescription,api: error.userInfo[errorAPINameKey] as? String)
            case .timedOut:
                self.init(code: LocalError.timedOut.rawValue, message: error.localizedDescription,
                          api: error.userInfo[errorAPINameKey] as? String)
            default:
                self.init(code: LocalError.unknownNetworkError.rawValue, message: error.localizedDescription,
                          api: error.userInfo[errorAPINameKey] as? String)
            }
            return
        } else if let error = error as? BaseError {
            self = error
            return
        }
        let error = error as NSError
        self.init(code: error.code,
                  message: error.localizedDescription,
                  api: error.userInfo[errorAPINameKey] as? String)
    }
}
