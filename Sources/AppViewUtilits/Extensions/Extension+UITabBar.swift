//
//  Extension+UITabBar.swift
//  
//
//  Created by Pavel Moslienko on 25.03.2019.
//

#if canImport(UIKit)
import UIKit
#endif

public extension UITabBar {
    
    func getViewForItemAt(index: Int) -> UIView? {
        let views = self.subviews.compactMap { $0 is UIControl ? $0 : nil }
        return views[safe: index]
    }
}
