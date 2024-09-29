//
//  AppTouchLabel.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 20.07.2024.
//  Copyright © 2024 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit

/// `UILabel` subclass with the ability to tap on it.
public class AppTouchLabel: AppLabel {
    
    // MARK: - Callbacks
    private let action: Callback
    
    // MARK: - Init
    public init(action: @escaping Callback) {
        self.action = action
        super.init(frame: .zero)
        self.isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        if let event, event.type == .touches {
            action()
        }
    }
}

#endif
