//
//  PlaceholderViewStyle.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 21.07.2024.
//  Copyright © 2024 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#endif

public extension DecorateWrapper where Element: UILabel {
    
    /// Default style for placeholder header label
    static func defaultPlaceholderHeaderStyle() -> DecorateWrapper {
        .wrap { label in
            label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            label.textAlignment = .center
            if #available(iOS 13.0, *) {
                label.textColor = UIColor.label
            } else {
                label.textColor = .black
            }
            label.numberOfLines = 2
        }
    }
    
    /// Default style for placeholder message label
    static func defaultPlaceholderMessageStyle() -> DecorateWrapper {
        .wrap { label in
            label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
            label.textAlignment = .center
            if #available(iOS 13.0, *) {
                label.textColor = UIColor.secondaryLabel
            } else {
                label.textColor = .gray
            }
            label.numberOfLines = 3
        }
    }
}

public extension DecorateWrapper where Element: AppButton {
    
    /// Default style for placeholder action button
    static func defaultPlaceholderButtonStyle() -> DecorateWrapper {
        .wrap { button in
            button.backgroundColor = .systemBlue
            button.tintColor = .white
            button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            button.layer.cornerRadius = 15
        }
    }
}
