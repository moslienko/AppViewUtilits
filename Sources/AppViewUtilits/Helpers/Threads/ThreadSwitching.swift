//
//  ThreadSwitching.swift
//
//
//  Created by Pavel Moslienko on 11.03.2020.
//

import Foundation

/// Executes a given closure on the main thread.
/// - Parameter work: The closure to be executed.
public func onMainThread(execute work: @escaping () -> Void) {
    if Thread.isMainThread {
        work()
    } else {
        DispatchQueue.main.async(execute: work)
    }
}

/// Executes a given closure on a background thread.
/// - Parameter work: The closure to be executed.
public func onBgThread(execute work: @escaping () -> Void) {
    if Thread.isMainThread {
        DispatchQueue.global().async(execute: work)
    } else {
        work()
    }
}
