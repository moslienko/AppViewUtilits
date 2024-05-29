//
//  ExampleCellModel.swift
//  Example
//
//  Created by Pavel Moslienko on 12.06.2023.
//  Copyright © 2023 moslienko. All rights reserved.
//

import AppViewUtilits
#if canImport(UIKit)
import UIKit
#endif

class ExampleCellModel: AppViewCellIdentifiable {
    
    let title: String
   
    init(title: String) {
        self.title = title
    }
}
