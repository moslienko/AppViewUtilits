//
//  DebouncedFunction.swift
//
//
//  Created by Pavel Moslienko on 25.03.2019.
//

import Foundation

/// Provide debouncing functionality for a given callback function.
public class DebouncedFunction: NSObject {
    
    private var callback: Callback
    private var delay: TimeInterval
    private weak var timer: Timer?
    
    /// Initializes a new instance of `DebouncedFunction`.
    /// - Parameters:
    ///   - delay: The debounce delay time interval in seconds.
    ///   - callback: The callback to invoke after the debounce delay.
    public init(delay: TimeInterval, callback: @escaping Callback) {
        self.delay = delay
        self.callback = callback
    }
    
    /// Calls the debounced function.
    /// If the function is called again before the delay has passed, the previous call is cancelled and the delay restarts.
    public func call() {
        timer?.invalidate()
        let nextTimer = Timer.scheduledTimer(timeInterval: delay, target: self, selector: #selector(DebouncedFunction.fire), userInfo: nil, repeats: false)
        timer = nextTimer
    }
    
    @objc
    private func fire() {
        self.callback()
    }
}
