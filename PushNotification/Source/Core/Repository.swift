//
//  Repository.swift
//  PushBot
//
//  Created by Mahmoud on 10/20/19.
//  Copyright © 2019 Mahmoud Fariss. All rights reserved.
//

import Foundation
func getData<T:Codable>(_ request :BaseRequest , _ dataPolicy:DataPolicy , successHandler: @escaping ((T) -> Void), faluire: @escaping ((BaseError) -> Void)) {
    
    if dataPolicy.dataSource() == .remote{
        APIClient().executeRequest(request, successHandler: { (value) in
            successHandler(value)
        }) { (error) in
            faluire(error)
        }
    }else{
        if let cachedData: T = dataPolicy.cachedType()?.getData(request.identifier){
            successHandler(cachedData)
        }else{
            faluire(BaseError(code: LocalError.emptyResponse.rawValue, message: NSLocalizedString("", comment: ""), api: request.url))
        }
    }
    
}

