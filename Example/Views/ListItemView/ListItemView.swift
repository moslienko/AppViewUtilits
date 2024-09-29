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
    var titleLabel: UILabel = {
        AppLabel()
    }()
    
    var actionButton: AppButton = {
        let button = AppButton()
        button.regularStyle = .actionButton()
        button.disabledStyle = .disabledButton()
        button.setTitle("Action", for: .normal)
        
        return button
    }()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func updateView() {
        guard let model = self.model as? ListItemViewModel else { return }
        
        titleLabel.textColor = .label
        self.titleLabel.text = model.title
        self.actionButton.isEnabled = model.isEnabled
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.layout.addToSuperview(self)
            .leading(to: self.leadingAnchor, offset: 8)
            .centerY(to: self.centerYAnchor)
        
        actionButton.layout.addToSuperview(self)
            .leading(to: self.titleLabel.trailingAnchor, offset: 8, type: .greaterThanOrEqual)
            .trailing(to: self.trailingAnchor, offset: -8)
            .height(50)
            .centerY(to: self.centerYAnchor)
        
        
        setupActions()
    }
    
    override func setupComponents() {
        self.actionButton.regularStyle = .actionButton()
        self.actionButton.disabledStyle = .disabledButton()
        self.actionButton.setTitle("Action", for: .normal)
    }
    
    override func applyStyles() {
        self.backgroundColor = .secondarySystemBackground
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
            label.textColor = .label
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
            btn.tintColor = .secondaryLabel
            btn.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        }
    }
}
