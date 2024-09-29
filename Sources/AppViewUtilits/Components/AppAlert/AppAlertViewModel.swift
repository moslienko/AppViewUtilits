//
//  AppAlertViewModel.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 23.07.2024.
//  Copyright © 2024 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit

/// Represents the model for configuring an `AppAlertController`.
public struct AppAlertViewModel {
    public let title: String?
    public let message: String?
    public let actions: [AlertAction]?
    public let preferredStyle: UIAlertController.Style
    public var configureTextField: ((UITextField) -> Void)?
    public var tintColor: UIColor
    public var preventMultipleAlerts: Bool
    
    /// Initializes a new `AppAlertViewModel`.
    /// - Parameters:
    ///   - title: The title of the alert.
    ///   - message: The message of the alert.
    ///   - actions: The actions to be added to the alert.
    ///   - preferredStyle: The preferred style of the alert.
    ///   - configureTextField: A closure to configure a text field.
    ///   - tintColor: The tint color of the alert.
    ///   - preventMultipleAlerts: A flag to prevent multiple alerts from being presented simultaneously.
    public init(
        title: String? = nil,
        message: String? = nil,
        actions: [AlertAction]? = nil,
        preferredStyle: UIAlertController.Style,
        configureTextField: ((UITextField) -> Void)? = nil,
        tintColor: UIColor = .systemBlue,
        preventMultipleAlerts: Bool = false
    ) {
        self.title = title
        self.message = message
        self.actions = actions
        self.preferredStyle = preferredStyle
        self.configureTextField = configureTextField
        self.tintColor = tintColor
        self.preventMultipleAlerts = preventMultipleAlerts
    }
}

#endif
