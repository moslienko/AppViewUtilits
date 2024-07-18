//
//  NotificationObserver.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 03.07.2023.
//  Copyright © 2023 moslienko. All rights reserved.
//

import Foundation

/// A class to manage notification events via NotificationCenter.
public class NotificationObserver {
    
    public let center: NotificationCenter
    private var observers: [NSObjectProtocol] = []
    
    /// Initializes a new `NotificationObserver`.
    /// - Parameter center: The notification center to observe.
    public init(center: NotificationCenter = .default) {
        self.center = center
    }
    
    deinit {
        removeAllObservers()
    }
    
    /// Adds a notification observer.
    /// - Parameters:
    ///   - name: The name of the notification to observe.
    ///   - obj: The object whose notifications the observer wants to receive.
    ///   - queue: The operation queue to which block should be added.
    ///   - block: The block to be executed when the notification is received.
    public func addObserver(forName name: NSNotification.Name?, object obj: Any?, queue: OperationQueue? = .main, using block: @escaping (Notification) -> Void) {
        let observer = center.addObserver(forName: name, object: obj, queue: queue, using: block)
        observers.append(observer)
    }
    
    /// Removes a specific notification observer.
    /// - Parameter observer: The observer to be removed.
    public func removeObserver(_ observer: AnyObject) {
        center.removeObserver(observer)
        if let index = observers.firstIndex(where: { $0 === observer }) {
            observers.remove(at: index)
        }
    }
    
    /// Removes all notification observers.
    public func removeAllObservers() {
        for observer in observers {
            center.removeObserver(observer)
        }
        observers.removeAll()
    }
}
