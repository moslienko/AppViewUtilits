//
//  Environment.swift
//  
//
//  Created by Pavel Moslienko on 28.11.2020.
//

import Foundation

public enum Environment {
    case debug
    case release
    case testFlight
}

public extension  Environment {
    
    static var current: Environment {
        #if DEBUG
        return .debug
        #else
        return Bundle.main.appStoreReceiptURL?.lastPathComponent == "sandboxReceipt" ? .testFlight : .release
        #endif
    }
    
}
