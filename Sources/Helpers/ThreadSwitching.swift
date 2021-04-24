//
//  ThreadSwitching.swift
//  
//
//  Created by Pavel Moslienko on 11.03.2020.
//

import Foundation

public func onMainThread(execute work: @escaping () -> Void) {
    if Thread.isMainThread {
        work()
    } else {
        DispatchQueue.main.async(execute: work)
    }
}

public func onBgThread(execute work: @escaping() -> Void) {
    if Thread.isMainThread {
        DispatchQueue.global().async(execute: work)
    } else {
        work()
    }
}
