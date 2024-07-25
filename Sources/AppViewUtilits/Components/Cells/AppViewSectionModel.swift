//
//  AppViewSectionModel.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 12.06.2023.
//  Copyright © 2023 moslienko. All rights reserved.
//

import Foundation

open class AppViewSectionModel<T: AppViewCellIdentifiable> {
    
    var items: [T]
    
    init(items: [T]) {
        self.items = items
    }
}
