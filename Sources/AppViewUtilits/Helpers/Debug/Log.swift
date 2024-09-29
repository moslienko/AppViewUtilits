//
//  Log.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 27.07.2021.
//  Copyright © 2022 moslienko. All rights reserved.
//

import Foundation

/// Create logging messages with different levels of severity.
public enum Log {
    
    /// Logs an informational message.
    /// - Parameter str: The message to log.
    public static func info(_ str: Any?) {
        let string = getFormattedLoggerString(from: str)
        
        #if DEBUG
        print("🔹 [INFO]: " + string)
        #else
        #endif
    }
    
    /// Logs a debug message.
    /// - Parameter str: The message to log.
    public static func debug(_ str: Any?) {
        let string = getFormattedLoggerString(from: str)

        #if DEBUG
        print("❇️ [DEBUG]: " + string)
        #else
        #endif
    }
    
    /// Logs an error message.
    /// - Parameters:
    ///   - str: The error message to log.
    ///   - function: The function name where the error occurred.
    ///   - line: The line number where the error occurred.
    ///   - save: A flag indicating whether to save the log message.
    public static func error(_ str: Any?, function: String = #function, line: Int = #line, save: Bool = false) {
        let string = getFormattedLoggerString(from: str)
        
        #if DEBUG
        print("❌ [ERROR]: " + "\(string) | \(function) on \(line)")
        if save {
            NSLog("[ERROR]: " + "\(string) | \(function) on \(line)")
        }
        #else
        #endif
    }
    
    /// Formats the log message string.
    /// - Parameter str: The message to format.
    /// - Returns: A formatted string.
    private static func getFormattedLoggerString(from str: Any?) -> String {
        if let error = str as? NSError {
            return error.localizedDescription
        }
        return str as? String ?? "\(str ?? "")"
    }
}
