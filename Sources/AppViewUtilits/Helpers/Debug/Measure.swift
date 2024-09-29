//
//  Measure.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 28.09.2024.
//  Copyright © 2024 moslienko. All rights reserved.
//

import Foundation

/// A utility class for measuring execution time and memory usage of code blocks.
public class Measure {
    
    /// Measures the execution time of a synchronous block of code.
    /// - Parameters:
    ///   - label: A name to identify the measurement.
    ///   - block: The block of code whose execution time is to be measured.
    public func measureExecutionTime(label: String = "Execution Time", _ block: () -> Void) {
        let startTime = Date().timeIntervalSince1970
        
        block()
        
        let endTime = Date().timeIntervalSince1970
        let executionTime = endTime - startTime
        
        Log.debug("\(label): \(executionTime) seconds")
    }
    
    /// Measures the execution time of an asynchronous block of code.
    /// - Parameters:
    ///   - label: A name to identify the measurement.
    ///   - block: The asynchronous block of code whose execution time is to be measured.
    public func measureAsyncExecutionTime(label: String = "Async Operation", _ block: (@escaping () -> Void) -> Void) {
        let startTime = Date().timeIntervalSince1970
        
        block {
            let endTime = Date().timeIntervalSince1970
            let executionTime = endTime - startTime
            Log.debug("\(label): Completed in \(executionTime) seconds")
        }
    }
    
    /// Measures the average execution time of a block of code over multiple runs.
    /// - Parameters:
    ///   - repeatCount: The number of times to repeat the block of code.
    ///   - label: A name to identify the measurement.
    ///   - block: The block of code whose average execution time is to be measured.
    public func measureAverageExecutionTime(repeatCount: Int, label: String = "Average Execution Time", _ block: () -> Void) {
        var totalExecutionTime: TimeInterval = 0
        
        for _ in 1...repeatCount {
            let startTime = Date().timeIntervalSince1970
            block()
            let endTime = Date().timeIntervalSince1970
            totalExecutionTime += (endTime - startTime)
        }
        
        let averageExecutionTime = totalExecutionTime / Double(repeatCount)
        Log.debug("\(label): Average time after \(repeatCount) runs is \(averageExecutionTime) seconds")
    }
    
    /// Measures the memory usage of a block of code.
    /// - Parameters:
    ///   - label: A name to identify the measurement.
    ///   - block: The block of code whose memory usage is to be measured.
    public func measureMemoryUsage(label: String = "Memory Usage", _ block: () -> Void) {
        let memoryBefore = reportMemoryUsage()
        
        block()
        
        let memoryAfter = reportMemoryUsage()
        let memoryDifference = memoryAfter - memoryBefore
        
        Log.debug("\(label): Memory used \(memoryDifference) MB")
    }
}

private extension Measure {
    
    /// Reports the current memory usage of the app in megabytes.
    /// - Returns: The memory usage in megabytes.
    func reportMemoryUsage() -> Double {
        var info = task_vm_info_data_t()
        var count = mach_msg_type_number_t(MemoryLayout<task_vm_info_data_t>.size) / 4
        let result = withUnsafeMutablePointer(to: &info) {
            $0.withMemoryRebound(to: integer_t.self, capacity: Int(count)) {
                task_info(mach_task_self_, task_flavor_t(TASK_VM_INFO), $0, &count)
            }
        }
        return result == KERN_SUCCESS ? Double(info.phys_footprint) / (1024 * 1024) : -1.0
    }
}
