//
//  PlaceholderOptions.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 21.07.2024.
//  Copyright © 2024 moslienko. All rights reserved.
//

import Foundation

/// Options for configuring a placeholder view, including icon and button options.
public struct PlaceholderOptions {
    /// The options for the placeholder icon.
    public var iconOptions: PlaceholderIconOptions
    
    /// The options for the placeholder button.
    public var buttonOptions: PlaceholderButtonOptions
    
    /// Initializes a new `PlaceholderOptions` instance.
    ///
    /// - Parameters:
    ///   - iconOptions: The options for the placeholder icon.
    ///   - buttonOptions: The options for the placeholder button.
    public init(
        iconOptions: PlaceholderIconOptions = PlaceholderIconOptions(),
        buttonOptions: PlaceholderButtonOptions = PlaceholderButtonOptions()
    ) {
        self.iconOptions = iconOptions
        self.buttonOptions = buttonOptions
    }
}
