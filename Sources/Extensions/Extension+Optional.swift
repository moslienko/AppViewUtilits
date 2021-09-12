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
