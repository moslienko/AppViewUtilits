//
//  AppThemeManager.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 23.07.2024.
//  Copyright © 2024 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit

/// A manager for dynamically changing the apps appearance by overriding the user interface style.
@available(iOS 13.0, *)
public class AppThemeManager {
    
    /// The default singleton instance of `AppThemeManager`.
    static public var `default` = AppThemeManager()
    
    /// The current override style for the user interface.
    private(set) var overrideUserInterfaceStyle: UIUserInterfaceStyle = .unspecified
    
    /// Set a new value for `UIUserInterfaceStyle`.
    public var setOverrideUserInterfaceStyleCallback: ValueCallback<UIUserInterfaceStyle>?
    
    /// Applies the app theme by overriding the user interface style for all windows.
    public func setAppTheme() {
        if let style = setOverrideUserInterfaceStyleCallback?() {
            overrideUserInterfaceStyle = style
        }
        
        guard #available(iOS 15, *) else {
            UIApplication.shared.windows
                .forEach { $0.overrideUserInterfaceStyle = overrideUserInterfaceStyle }
            return
        }
        
        UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .forEach({
                $0.windows.forEach({
                    $0.overrideUserInterfaceStyle = overrideUserInterfaceStyle
                })
            })
    }
}

#endif
