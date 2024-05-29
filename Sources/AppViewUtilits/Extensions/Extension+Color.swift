//
//  Extension+Color.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 29.05.2024.
//  Copyright © 2024 moslienko. All rights reserved.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
public extension Color {
    
    init(hex string: String) {
        var hex = string.hasPrefix("#") ? String(string.dropFirst()) : string
        guard hex.count == 3 || hex.count == 6
        else {
            self.init(white: 1.0)
            return
        }
        if hex.count == 3 {
            for (index, char) in hex.enumerated() {
                hex.insert(char, at: hex.index(hex.startIndex, offsetBy: index * 2))
            }
        }
        
        self.init(
            red:   CGFloat((Int(hex, radix: 16)! >> 16) & 0xFF) / 255.0,
            green: CGFloat((Int(hex, radix: 16)! >> 8) & 0xFF) / 255.0,
            blue:  CGFloat((Int(hex, radix: 16)!) & 0xFF) / 255.0)
    }
    
    init(r: Double, g: Double, b: Double) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0)
    }
    
    static var random: Color {
        switch (Int.random(in: 0...5)) {
        case 0:
            return Color.red
        case 1:
            return Color.orange
        case 2:
            return Color.yellow
        case 3:
            return Color.green
        case 4:
            return Color.blue
        case 5:
            return Color.purple
        default:
            return .black
        }
    }
}

@available(iOS 13.0, *)
public extension UIColor {
    
    convenience init(
        light lightModeColor: @escaping @autoclosure () -> UIColor,
        dark darkModeColor: @escaping @autoclosure () -> UIColor
    ) {
        self.init { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .light:
                return lightModeColor()
            case .dark:
                return darkModeColor()
            case .unspecified:
                return lightModeColor()
            @unknown default:
                return lightModeColor()
            }
        }
    }
}
