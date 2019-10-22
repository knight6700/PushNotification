//
//  DataPolicy.swift
//  PushBot
//
//  Created by Mahmoud on 10/20/19.
//  Copyright © 2019 Mahmoud Fariss. All rights reserved.
//

import Foundation

enum DataSource{
    case remote
    case local
}
protocol DataPolicy {
    func dataSource() -> DataSource
    func isDataCached() -> Bool
    func cachedType() -> CachingProtocol?
}
