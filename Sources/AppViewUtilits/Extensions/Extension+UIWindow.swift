//
//  Extension+UIWindow.swift
//  
//
//  Created by Pavel Moslienko on 28.11.2020.
//

#if canImport(UIKit)
import UIKit

public extension UIWindow {
    
    /**
     Create new window
     
     - Parameter vc: View Controller
     - Parameter tintColor: Tint color
     - Parameter frame: frame for window
     
     - Returns: New window
     **/
    static func create(vc: UIViewController, tintColor: UIColor?, frame: CGRect = UIScreen.main.bounds) -> UIWindow {
        let window = UIWindow(frame: frame)
        window.tintColor = tintColor
        window.rootViewController = vc
        window.makeKeyAndVisible()
        
        return window
    }
    
}

#endif
