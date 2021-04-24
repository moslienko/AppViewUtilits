//
//  AppViewTableCell.swift
//  Example
//
//  Created by Pavel Moslienko on 24.04.2021.
//  Copyright © 2021 moslienko. All rights reserved.
//

import UIKit

open class AppViewTableCell: UITableViewCell {
    private var view: AppView?
    
    func setup(_ view: AppView) {
        self.view = view
        self.addConstrained(subview: view)
        self.updateView()
    }
    
    func updateView() {}
}
