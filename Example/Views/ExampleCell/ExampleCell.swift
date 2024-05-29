//
//  ExampleCell.swift
//  Example
//
//  Created by Pavel Moslienko on 12.06.2023.
//  Copyright © 2023 moslienko. All rights reserved.
//

import AppViewUtilits
#if canImport(UIKit)
import UIKit
#endif

class ExampleCell: AppViewTableCell<ExampleCellModel> {
    
    override func updateView() {
        guard let cellModel = cellModel else {
            return
        }
        
        self.textLabel?.text = cellModel.title
        self.tintColor = .systemBlue
        self.layoutIfNeeded()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
