//
//  PlaceholderContainerOptions.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 22.07.2024.
//  Copyright © 2024 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#endif

// Options for configuring the placeholder container view.
public struct PlaceholderContainerOptions {
    /// Container insets
    public var insets: UIEdgeInsets
    
    /// Container background color
    public var backgroundColor: UIColor
    
    /// Layout for action button.
    public var buttonLayout: PlaceholderButtonLayout
    
    /// Spacing between action button and labels
    public var buttonTopSpacing: CGFloat
    
    /// Spacing between title and message labels
    public var textsSpacing: CGFloat
    
    /// Initializes a new `PlaceholderContainerOptions` instance.
    /// - Parameters:
    ///   - insets: Container insets.
    ///   - backgroundColor: Container background color.
    ///   - buttonLayout: Layout for action button.
    ///   - buttonTopSpacing: Spacing between action button and labels.
    ///   - textsSpacing: Spacing between title and message labels.
    public init(
        insets: UIEdgeInsets = .zero,
        backgroundColor: UIColor = .clear,
        buttonLayout: PlaceholderButtonLayout = .center,
        buttonTopSpacing: CGFloat = 16.0,
        textsSpacing: CGFloat = 8.0
    ) {
        self.insets = insets
        self.backgroundColor = backgroundColor
        self.buttonLayout = buttonLayout
        self.buttonTopSpacing = buttonTopSpacing
        self.textsSpacing = textsSpacing
    }
}
