//
//  Extension+NSPredicate.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 29.05.2024.
//  Copyright © 2024 moslienko. All rights reserved.
//

import Foundation
import CoreData

public extension NSPredicate {
    static var all = NSPredicate(format: "TRUEPREDICATE")
    static var none = NSPredicate(format: "FALSEPREDICATE")
}
