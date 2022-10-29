//
//  Log.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 27.07.2021.
//  Copyright © 2022 moslienko. All rights reserved.
//

import Foundation

public enum Log {
    
    public static func info(_ str: Any?) {
        let string = self.getFormattedLoggerString(from: str)
        
        #if DEBUG
        print("🔹 [INFO]: " + "\(string)")
        #else
        #endif
    }
    
    public static func debug(_ str: Any?) {
        let string = self.getFormattedLoggerString(from: str)

        #if DEBUG
        print("❇️ [DEBUG]: " + "\(string)")
        #else
        #endif
    }
    
    public static func error(_ str: Any?, function: String = #function, line: Int = #line, save: Bool = false) {
        let string = self.getFormattedLoggerString(from: str)
        
        #if DEBUG
        print("❌ [ERROR]: " + "\(string) | \(function) on \(line)")
        if save {
            NSLog("[ERROR]: " + "\(string) | \(function) on \(line)")
        }
        #else
        #endif
    }
    
    private static func getFormattedLoggerString(from str: Any?) -> String {
        var string: String {
            if let error = str as? NSError {
                return error.localizedDescription
            }
            return str as? String ?? "\(str ?? "")"
        }
        
        return string
    }
}
