//
//  ListItemViewModel.swift
//  Example
//
//  Created by Pavel Moslienko on 24.04.2021.
//  Copyright © 2021 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#endif
import AppViewUtilits

class ListItemViewModel: AppViewModel {
    
    var title: String
    var isEnabled: Bool
    var actionCallback: Callback?

    init(title: String, isEnabled: Bool, inset: UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)) {
        self.title = title
        self.isEnabled = isEnabled
        super.init()
        self.inset = inset
    }
}
