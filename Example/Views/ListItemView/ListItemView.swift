//
//  ListItemView.swift
//  Example
//
//  Created by Pavel Moslienko on 24.04.2021.
//  Copyright © 2021 moslienko. All rights reserved.
//

import UIKit
import AppViewUtilits

class ListItemView: AppView {
    
    // MARK: - Outlet
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var actionButton: UIButton!
    
    @IBOutlet private weak var viewTopConstaint: NSLayoutConstraint!
    @IBOutlet private weak var viewBottomConstaint: NSLayoutConstraint!
    @IBOutlet private weak var viewLeftConstaint: NSLayoutConstraint!
    @IBOutlet private weak var viewRightConstaint: NSLayoutConstraint!
    
    override func updateView() {
        guard let model = self.model as? ListItemViewModel else { return }
        
        self.titleLabel.text = model.title
        
        self.viewTopConstaint.constant = model.inset.top
        self.viewBottomConstaint.constant = model.inset.bottom
        self.viewLeftConstaint.constant =  model.inset.left
        self.viewRightConstaint.constant = model.inset.right
    }
    
    override func setupComponents() {
        self.actionButton.setTitle("Action", for: .normal)
    }
    
    override func applyStyles() {
        self.backgroundColor = .white
        
        self.titleLabel.numberOfLines = 0
        self.titleLabel.textAlignment = .left
        self.titleLabel.font = UIFont.boldSystemFont(ofSize: 14.0)
        self.titleLabel.textColor = .black
    }
    
    override func setupActions() {
        self.actionButton.addAction(for: .touchUpInside, {
            guard let model = self.model as? ListItemViewModel else { return }
            model.actionCallback?()
        })
    }
}
