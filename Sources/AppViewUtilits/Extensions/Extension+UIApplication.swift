//
//  Extension+UIApplication.swift
//  
//
//  Created by Pavel Moslienko on 25.12.2019.
//

#if canImport(UIKit)
import UIKit

public extension UIApplication {
    
    class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)
        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)
        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        
        return base
    }
}

#endif
