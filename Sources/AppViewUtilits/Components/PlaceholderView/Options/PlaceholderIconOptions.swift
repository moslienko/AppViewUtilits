//
//  PlaceholderIconOptions.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 21.07.2024.
//  Copyright © 2024 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit

// Options for configuring the appearance of a placeholder icon.
public struct PlaceholderIconOptions {
    /// The height of the icon.
    public var height: CGFloat
    
    /// The tint color of the icon.
    public var tintColor: UIColor
    
    /// The content mode of the icon.
    public var contentMode: UIView.ContentMode
    
    /// Initializes a new `PlaceholderIconOptions` instance.
    /// - Parameters:
    ///   - height: The height of the icon.
    ///   - tintColor: The tint color of the icon.
    ///   - contentMode: The content mode of the icon.
    public init(
        height: CGFloat = 64.0,
        tintColor: UIColor = .systemGray,
        contentMode: UIView.ContentMode = .scaleAspectFit
    ) {
        self.height = height
        self.tintColor = tintColor
        self.contentMode = contentMode
    }
}

#endif
