//
//  Extension+Notifications.swift
//  
//
//  Created by Pavel Moslienko on 16.01.2020.
//

import Foundation

public protocol NotificationName {
    var name: Notification.Name { get }
}

extension RawRepresentable where RawValue == String, Self: NotificationName {
    var name: Notification.Name {
        return Notification.Name(self.rawValue)
    }
}
