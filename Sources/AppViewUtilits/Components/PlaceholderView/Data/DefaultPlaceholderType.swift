//
//  DefaultPlaceholderType.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 21.07.2024.
//  Copyright © 2024 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#endif

// Default empty placeholder type
enum DefaultPlaceholderType: PlaceholderType {
    case empty
    
    var icon: UIImage? {
        nil
    }
    
    var title: String {
        ""
    }
    
    var message: String? {
        nil
    }
    
    var buttonTitle: String? {
        nil
    }
}
