//
//  AppViewTableCell.swift
//  Example
//
//  Created by Pavel Moslienko on 24.04.2021.
//  Copyright © 2021 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#endif

open class AppViewTableCell<T: AppViewCellIdentifiable>: UITableViewCell {
    
    open var cellModel: T? {
        didSet {
            updateView()
        }
    }
    
    open func updateView() { }
}
