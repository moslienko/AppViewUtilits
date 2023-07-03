//
//  NotificationObserver.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 03.07.2023.
//  Copyright © 2023 moslienko. All rights reserved.
//

import Foundation

public class NotificationObserver {
    
    public let center: NotificationCenter
    private var observers: [NSObjectProtocol] = []
    
    public init(center: NotificationCenter = .default) {
        self.center = center
    }
    deinit {
        removeAllObservers()
    }
    
    public func addObserver(forName name: NSNotification.Name?, object obj: Any?, queue: OperationQueue? = .main, using block: @escaping (Notification) -> Void) {
        let observer = center.addObserver(forName: name, object: obj, queue: queue, using: block)
        observers.append(observer)
    }
    
    public func removeObserver(_ observer: AnyObject) {
        center.removeObserver(observer)
        if let index = observers.firstIndex(where: { $0 === observer }) {
            observers.remove(at: index)
        }
    }
    
    public func removeAllObservers() {
        for observer in observers {
            center.removeObserver(observer)
        }
        observers.removeAll()
    }
}
