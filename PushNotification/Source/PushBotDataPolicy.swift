//
//  PushBotDataPolicy.swift
//  PushBot
//
//  Created by Sally on 10/20/19.
//  Copyright © 2019 Sally Ahmed. All rights reserved.
//

import Foundation
class PushBotDataPolicy : DataPolicy{
    func dataSource() -> DataSource {
        return .remote
    }
    
    func isDataCached() -> Bool {
        return false
    }
    
    func cachedType() -> CachingProtocol? {
        return nil
    }
    
    
}
