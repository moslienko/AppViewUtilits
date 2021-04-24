//
//  ListItemViewModel.swift
//  Example
//
//  Created by Pavel Moslienko on 24.04.2021.
//  Copyright © 2021 moslienko. All rights reserved.
//

import UIKit
import AppViewUtilits

class ListItemViewModel: AppViewModel {
    
    var title: String
    var actionCallback: (() -> Void)?

    init(title: String, inset: UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)) {
        self.title = title
        super.init()
        self.inset = inset
    }
}
