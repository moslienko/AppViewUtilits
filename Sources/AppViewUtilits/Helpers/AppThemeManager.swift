//
//  AppThemeManager.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 23.07.2024.
//  Copyright © 2024 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#endif

// Dynamic change app appearance
@available(iOS 13.0, *)
public class AppThemeManager {
    
    static public var `default` = AppThemeManager()
    
    private(set) var overrideUserInterfaceStyle: UIUserInterfaceStyle = .unspecified
    public var setOverrideUserInterfaceStyleCallback: ValueCallback<UIUserInterfaceStyle>?
    
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
