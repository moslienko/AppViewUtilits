//
//  PlaceholderType.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 21.07.2024.
//  Copyright © 2024 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#endif

/// A protocol representing the type of a placeholder
public protocol PlaceholderType {
    /// Placeholder icon
    var icon: UIImage? { get }
    
    /// Placeholder title text
    var title: String { get }
    
    /// Placeholder message text
    var message: String? { get }
    
    /// Placeholder action button title (if need button)
    var buttonTitle: String? { get }
}
