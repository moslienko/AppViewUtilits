//
//  AlertAction.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 23.07.2024.
//  Copyright © 2024 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#endif

/// Represents an action that can be added to an alert.
public struct AlertAction {
    public let title: String?
    public let style: UIAlertAction.Style
    public let action: Callback?
    
    /// Initializes a new `AlertAction`.
    /// - Parameters:
    ///   - title: The title of the action.
    ///   - style: The style of the action.
    ///   - action: The callback to be executed when the action is selected.
    public init(title: String?, style: UIAlertAction.Style, action: Callback?) {
        self.title = title
        self.style = style
        self.action = action
    }
}
