//
//  RecursionFunction.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 18.07.2024.
//  Copyright © 2024 moslienko. All rights reserved.
//

import Foundation

/// Performs a recursive operation with a condition check and retry mechanism.
public class RecursionFunction: NSObject {
    
    /// The maximum number of retries allowed for the recursive operation.
    public var maxRetryCount: Int
    
    /// Initializes a new instance of `RecursionFunction`.
    /// - Parameter maxRetryCount: The maximum number of retries allowed.
    public init(maxRetryCount: Int) {
        self.maxRetryCount = maxRetryCount
    }
    
    /// Performs a recursive operation with a condition check and retry mechanism.
    /// - Parameters:
    ///   - isCondition: A closure that returns a `Bool` indicating whether the condition is met.
    ///   - didHandleMethod: A closure that contains the code to be executed when the condition is met.
    ///   - delay: The delay in seconds between each retry.
    ///   - retryCount: The current retry count.
    public func performRecursion(
        isCondition: @escaping () -> Bool,
        didHandleMethod: @escaping Callback,
        delay: TimeInterval,
        retryCount: Int = 1
    ) {
        DispatchQueue.main.async {
            if isCondition() {
                didHandleMethod()
            } else if retryCount < self.maxRetryCount {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    self.performRecursion(
                        isCondition: isCondition,
                        didHandleMethod: didHandleMethod,
                        delay: delay,
                        retryCount: retryCount + 1
                    )
                }
            }
        }
    }
}
