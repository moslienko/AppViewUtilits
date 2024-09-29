//
//  Environment.swift
//  
//
//  Created by Pavel Moslienko on 28.11.2020.
//

import Foundation

/// Build environments.
public enum Environment {
    case debug
    case release
    case testFlight
}

/// Current environment detection.
public extension Environment {
    
    /// The current environment of the app.
    static var current: Environment {
        #if DEBUG
        return .debug
        #else
        return Bundle.main.appStoreReceiptURL?.lastPathComponent == "sandboxReceipt" ? .testFlight : .release
        #endif
    }
}
