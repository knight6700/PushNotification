 //
 //  APIClient.swift
 //  PushBot
 //
 //  Created by Mahmoud on 10/20/19.
 //  Copyright © 2019 Mahmoud Fariss. All rights reserved.
 //
 
 import Foundation
 
 class APIClient: NSObject ,NetworkProtocol {
    func executeRequest<T>(_ baseRequest: BaseRequest, successHandler: @escaping ((T) -> Void), faluire: @escaping ((BaseError) -> Void)) where T :Codable {
        let request: NSMutableURLRequest!
        
        let session = URLSession.init(configuration: URLSessionConfiguration.background(withIdentifier: "com.sallyzone.pushbot"))
        guard let url = URL(string:baseRequest.url) else{
            let clientError = BaseError(code: LocalError.badURL.rawValue, message: NSLocalizedString("", comment: ""), api: baseRequest.url)
            faluire(clientError)
            return
        }
        
        request = NSMutableURLRequest(url: url)
        request.httpMethod = baseRequest.httpMethod.rawValue
        if let paramters = baseRequest.parameters {
            request.httpBody = try? JSONSerialization.data(withJSONObject: paramters, options: [])
        }
        
        if let headers = baseRequest.headers {
            for item in headers{
                request.addValue(item.value, forHTTPHeaderField: item.key)
            }
        }
        let task = session.dataTask(with: request as URLRequest) { data, response, error in
            
            if error != nil || data == nil {
                print("Client error!")
                if let error = error{
                    let clientError = BaseError(error: error)
                    faluire(clientError)
                }else{
                    let clientError = BaseError(code: LocalError.emptyResponse.rawValue, message: NSLocalizedString("", comment: ""), api: baseRequest.url)
                    faluire(clientError)
                }
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Server error!")
                let clientError = BaseError(code: (response as? HTTPURLResponse)?.statusCode ?? 500, message: NSLocalizedString("server_error", comment: ""), api: baseRequest.url)
                faluire(clientError)
                return
            }
            
            guard let mime = httpResponse.mimeType, mime == "application/json" else {
                print("Wrong MIME type!")
                let clientError = BaseError(code: LocalError.mimeType.rawValue, message: NSLocalizedString("", comment: ""), api: baseRequest.url)
                faluire(clientError)
                return
            }
            
            let value = try? JSONDecoder().decode(T.self, from: data!)
            if let codableValue = value {
                successHandler(codableValue)
            }else{
                let clientError = BaseError(code: LocalError.parsing.rawValue, message: NSLocalizedString("", comment: ""), api: baseRequest.url)
                faluire(clientError)
            }
        }
        
        task.resume()
    }
    
 }
