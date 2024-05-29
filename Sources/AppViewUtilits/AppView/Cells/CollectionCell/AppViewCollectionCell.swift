//
//  AppViewCollectionCell.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 12.06.2023.
//  Copyright © 2023 moslienko. All rights reserved.
//

import Foundation
#if canImport(UIKit)
import UIKit
#endif

open class AppViewCollectionCell<T: AppViewCellIdentifiable>: UICollectionViewCell {
    
    open var cellModel: T? {
        didSet {
            updateView()
        }
    }
    
    open func updateView() { }
}
