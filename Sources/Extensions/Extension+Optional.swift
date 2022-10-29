//
//  Extension+Optional.swift
//  Example
//
//  Created by Pavel Moslienko on 12.09.2021.
//  Copyright © 2021 moslienko. All rights reserved.
//

import Foundation

public extension Optional where Wrapped == String {
    
    var isNull: Bool {
        (self ?? "").isEmpty
    }
}

public extension Optional where Wrapped == Int {
    
    func setPositiveValueOrZero() -> Int {
        guard let val = self else {
            return 0
        }
        return val < 0 ? 0 : val
    }
}
