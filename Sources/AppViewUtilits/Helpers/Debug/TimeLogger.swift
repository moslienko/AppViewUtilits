//
//  TimeLogger.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 28.09.2024.
//  Copyright © 2024 moslienko. All rights reserved.
//

import Foundation

/// A utility class for logging the time taken by various sections of code.
public class TimeLogger {
    
    /// Store the start times for different sections.
    private var startTimes: [String: TimeInterval] = [:]

    /// Starts timing a section of code.
    /// - Parameter section: The name of the section to start timing.
    public func startSection(_ section: String) {
        startTimes[section] = Date().timeIntervalSince1970
        Log.debug("Started \(section) at \(startTimes[section]!)")
    }
    
    /// Ends timing a section of code and logs the elapsed time.
    /// - Parameter section: The name of the section to end timing.
    public func endSection(_ section: String) {
        guard let startTime = startTimes[section] else {
            Log.debug("Section \(section) was not started")
            return
        }
        let elapsedTime = Date().timeIntervalSince1970 - startTime
        Log.debug("Finished \(section), elapsed time: \(elapsedTime) seconds")
    }
}
