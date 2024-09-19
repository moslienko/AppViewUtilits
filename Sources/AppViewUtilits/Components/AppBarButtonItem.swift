//
//  AppBarButtonItem.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 24.07.2024.
//  Copyright © 2024 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public class AppBarButtonItem: UIBarButtonItem {
    
    // MARK: - Callback
    public var didButtonTapped: Callback?
    
    // MARK: - Init
    convenience public init(
        title: String,
        style: UIBarButtonItem.Style,
        action: Callback?
    ) {
        self.init()
        self.title = title
        self.style = style
        self.didButtonTapped = action
    }
    
    convenience public init(
        icon: UIImage?,
        style: UIBarButtonItem.Style,
        action: Callback?
    ) {
        self.init()
        self.image = icon
        self.style = style
        self.didButtonTapped = action
        
    }
    
    override public init() {
        super.init()
        self.target = self
        self.action = #selector(buttonTapped)
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Private methods
public extension AppBarButtonItem {
    
    @objc
    func buttonTapped() {
        self.didButtonTapped?()
    }
}

#endif
