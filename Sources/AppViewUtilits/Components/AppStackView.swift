//
//  AppStackView.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 21.07.2024.
//  Copyright © 2024 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public class AppStackView: UIStackView {
    
    // MARK: - Init
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public init(
        subviews: [UIView],
        axis: NSLayoutConstraint.Axis,
        spacing: CGFloat = 0,
        distribution: Distribution = .fill
    ) {
        super.init(frame: .zero)
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
        subviews.forEach { self.addArrangedSubview($0) }
    }
    
    public convenience init(
        _ subviews: [UIView],
        axis: NSLayoutConstraint.Axis,
        spacing: CGFloat = 0,
        distribution: Distribution = .fill
    ) {
        self.init(subviews: subviews, axis: axis, spacing: spacing, distribution: distribution)
    }
}

// MARK: - Public methods
public extension AppStackView {
    
    /// Get arranged subviews
    func arrangedSubviews<T: UIView>(kindOf type: T.Type) -> [T] {
        subviews.compactMap { $0 as? T }
    }
}

#endif
