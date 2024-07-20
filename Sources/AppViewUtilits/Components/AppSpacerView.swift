//
//  AppSpacerView.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 20.07.2024.
//  Copyright © 2024 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#endif

public class AppSpacerView: AppView {
    
    public enum Direction {
        case vertical(CGFloat)
        case horizontal(CGFloat)
    }
    
    // MARK: - Params
    lazy public var heightConstraint: NSLayoutConstraint = {
        return self.heightAnchor.constraint(equalToConstant: 0)
    }()
    
    private lazy var widthConstraint: NSLayoutConstraint = {
        return self.widthAnchor.constraint(equalToConstant: 0)
    }()
    
    public var direction: Direction? {
        didSet {
            setupComponents()
        }
    }
    
    // MARK: - Init
    public init(_ direction: Direction? = nil) {
        super.init(frame: .zero)
        self.direction = direction
        setupComponents()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupComponents()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setupComponents()
    }
    
    public override func setupComponents() {
        super.setupComponents()
        
        switch direction {
        case .none:
            widthConstraint.isActive = false
            heightConstraint.isActive = false
        case let .vertical(size):
            widthConstraint.isActive = false
            heightConstraint.isActive = true
            heightConstraint.constant = size
        case let .horizontal(size):
            widthConstraint.isActive = true
            heightConstraint.isActive = false
            widthConstraint.constant = size
        }
    }
}

// MARK: - Factory Methods
public extension AppSpacerView {

    static func createView(_ direction: AppSpacerView.Direction, color: UIColor) -> AppSpacerView {
        let spacer = AppSpacerView(direction)
        spacer.backgroundColor = color
        
        return spacer
    }
    
    static func createView(_ direction: AppSpacerView.Direction, color: UIColor, width: Double) -> AppSpacerView {
        let spacer = AppSpacerView(direction)
        spacer.backgroundColor = color
        spacer.frame.size.width = width
        
        return spacer
    }
}
