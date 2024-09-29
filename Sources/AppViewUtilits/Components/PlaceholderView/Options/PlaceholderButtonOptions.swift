//
//  PlaceholderButtonOptions.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 21.07.2024.
//  Copyright © 2024 moslienko. All rights reserved.
//

import Foundation

/// Options for configuring the appearance of a placeholder button.
public struct PlaceholderButtonOptions {
    /// The height of the button.
    public var height: CGFloat
    
    /// The left offset of the button.
    public var leftOffset: CGFloat
    
    /// The right offset of the button.
    public var rightOffset: CGFloat
    
    /// The bottom offset of the button.
    public var bottomOffset: CGFloat
    
    /// Initializes a new `PlaceholderButtonOptions` instance.
    ///
    /// - Parameters:
    ///   - height: The height of the button.
    ///   - leftOffset: The left offset of the button.
    ///   - rightOffset: The right offset of the button.
    ///   - bottomOffset: The bottom offset of the button.
    public init(
        height: CGFloat = 44.0,
        leftOffset: CGFloat = 32.0,
        rightOffset: CGFloat = 32.0,
        bottomOffset: CGFloat = 0.0
    ) {
        self.height = height
        self.leftOffset = leftOffset
        self.rightOffset = rightOffset
        self.bottomOffset = bottomOffset
    }
}
