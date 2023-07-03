//
//  ListItemView.swift
//  Example
//
//  Created by Pavel Moslienko on 24.04.2021.
//  Copyright © 2021 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#endif
import AppViewUtilits

class ListItemView: AppView {
    
    // MARK: - Outlet
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var actionButton: AppButton!
    
    @IBOutlet private weak var viewTopConstaint: NSLayoutConstraint!
    @IBOutlet private weak var viewBottomConstaint: NSLayoutConstraint!
    @IBOutlet private weak var viewLeftConstaint: NSLayoutConstraint!
    @IBOutlet private weak var viewRightConstaint: NSLayoutConstraint!
    
    override func updateView() {
        guard let model = self.model as? ListItemViewModel else { return }
        
        self.titleLabel.text = model.title
        self.actionButton.isEnabled = model.isEnabled
        print("isEnabled - \(model.isEnabled)")
        self.viewTopConstaint.constant = model.inset.top
        self.viewBottomConstaint.constant = model.inset.bottom
        self.viewLeftConstaint.constant =  model.inset.left
        self.viewRightConstaint.constant = model.inset.right
    }
    
    override func setupComponents() {
        self.actionButton.regularStyle = .actionButton()
        self.actionButton.disabledStyle = .disabledButton()
        self.actionButton.setTitle("Action", for: .normal)
    }
    
    override func applyStyles() {
        self.backgroundColor = .white
        self.titleLabel.apply(.headerStyle())
    }
    
    override func setupActions() {
        self.actionButton.addAction {
            guard let model = self.model as? ListItemViewModel else {
                return
            }
            model.actionCallback?()
        }
    }
}

extension DecorateWrapper where Element: UILabel {
    static func headerStyle() -> DecorateWrapper {
        return .wrap { label in
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 14.0)
            label.textAlignment = .left
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 0
        }
    }
}

extension DecorateWrapper where Element: UIButton {
    static func actionButton() -> DecorateWrapper {
        return .wrap { btn in
            btn.setTitleColor(.systemBlue, for: [])
            btn.tintColor = .systemBlue
            btn.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        }
    }
    
    static func disabledButton() -> DecorateWrapper {
        return .wrap { btn in
            btn.setTitleColor(.systemGray, for: [])
            btn.tintColor = .systemGray
            btn.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        }
    }
}
