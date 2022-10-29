//
//  DebouncedFunction.swift
//  
//
//  Created by Pavel Moslienko on 25.03.2019.
//

import Foundation

public class DebouncedFunction: NSObject {
    
    private var callback: (() -> Void)
    private var delay: TimeInterval
    private weak var timer: Timer?
    
    /// debounced function initializer
    /// - parameter delay: debounce delay time interval in seconds
    /// - parameter callback: callback to invoke with debounce
    public init(delay: TimeInterval, callback: @escaping (() -> Void)) {
        self.delay = delay
        self.callback = callback
    }
    
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
