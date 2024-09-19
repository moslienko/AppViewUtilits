//
//  AppLayout.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 24.07.2024.
//  Copyright © 2024 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public extension UIView {
    
    var layout: AppLayout {
        return AppLayout(view: self)
    }
}

public enum ConstaintType {
    case equal, greaterThanOrEqual, lessThanOrEqual
}

public class AppLayout {
    
    private var view: UIView
    
    // MARK: - Init
    public init(view: UIView) {
        self.view = view
        self.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public func removeConstraint(with type: NSLayoutConstraint.Attribute) {
        if let constraint = view.findConstraint(layoutAttribute: type) {
            // constraint.isActive = false
            self.view.removeConstraint(constraint)
        }
    }
}

// MARK: - Private methods
private extension AppLayout {
    
    func removeEdgesConstraints() {
        removeConstraint(with: .top)
        removeConstraint(with: .bottom)
        removeConstraint(with: .leading)
        removeConstraint(with: .trailing)
    }
}

// MARK: - Edges
public extension AppLayout {
    
    @discardableResult
    func addToSuperview(_ superview: UIView) -> Self {
        superview.addSubview(view)
        return self
    }
    
    @discardableResult
    func edgesToSuperview(insets: UIEdgeInsets = .zero) -> Self {
        removeEdgesConstraints()

        if let superview = view.superview {
            view.topAnchor.constraint(equalTo: superview.topAnchor, constant: insets.top).isActive = true
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -insets.bottom).isActive = true
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: insets.left).isActive = true
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -insets.right).isActive = true
        }
        return self
    }
    
    @discardableResult
    func edgesToSafeArea(of view: UIView, insets: UIEdgeInsets = .zero) -> Self {
        removeEdgesConstraints()

        let safeArea = view.safeAreaLayoutGuide
        view.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: insets.top).isActive = true
        view.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -insets.bottom).isActive = true
        view.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: insets.left).isActive = true
        view.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -insets.right).isActive = true
        return self
    }
}

// MARK: - Size
public extension AppLayout {
    
    @discardableResult
    func width(_ constant: CGFloat, type: ConstaintType = .equal) -> Self {
        removeConstraint(with: .width)
        
        switch type {
        case .equal:
            view.widthAnchor.constraint(equalToConstant: constant).isActive = true
        case .greaterThanOrEqual:
            view.widthAnchor.constraint(greaterThanOrEqualToConstant: constant).isActive = true
        case .lessThanOrEqual:
            view.widthAnchor.constraint(lessThanOrEqualToConstant: constant).isActive = true
        }
        
        return self
    }
    
    @discardableResult
    func height(_ constant: CGFloat, type: ConstaintType = .equal) -> Self {
        removeConstraint(with: .height)

        switch type {
        case .equal:
            view.heightAnchor.constraint(equalToConstant: constant).isActive = true
        case .greaterThanOrEqual:
            view.heightAnchor.constraint(greaterThanOrEqualToConstant: constant).isActive = true
        case .lessThanOrEqual:
            view.heightAnchor.constraint(lessThanOrEqualToConstant: constant).isActive = true
        }
        
        return self
    }
    
    @discardableResult
    func size(_ size: CGSize) -> Self {
        self.width(size.width)
        self.height(size.height)
        return self
    }
    
    @discardableResult
    func aspectRatio(_ ratio: CGFloat) -> Self {
        removeConstraint(with: .width)
        view.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: ratio).isActive = true
        return self
    }
    
    @discardableResult
    func width(equalTo dimension: NSLayoutDimension, multiplier: CGFloat = 1.0) -> Self {
        removeConstraint(with: .width)
        view.widthAnchor.constraint(equalTo: dimension, multiplier: multiplier).isActive = true
        return self
    }
    
    @discardableResult
    func height(equalTo dimension: NSLayoutDimension, multiplier: CGFloat = 1.0) -> Self {
        removeConstraint(with: .height)
        view.heightAnchor.constraint(equalTo: dimension, multiplier: multiplier).isActive = true
        return self
    }
}

// MARK: - Position
public extension AppLayout {
    
    @discardableResult
    func centerX(to anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0, type: ConstaintType = .equal) -> Self {
        removeConstraint(with: .centerX)

        switch type {
        case .equal:
            view.centerXAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
        case .greaterThanOrEqual:
            view.centerXAnchor.constraint(greaterThanOrEqualTo: anchor, constant: offset).isActive = true
        case .lessThanOrEqual:
            view.centerXAnchor.constraint(lessThanOrEqualTo: anchor, constant: offset).isActive = true
        }
        
        return self
    }
    
    @discardableResult
    func centerY(to anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0, type: ConstaintType = .equal) -> Self {
        removeConstraint(with: .centerY)

        switch type {
        case .equal:
            view.centerYAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
        case .greaterThanOrEqual:
            view.centerYAnchor.constraint(greaterThanOrEqualTo: anchor, constant: offset).isActive = true
        case .lessThanOrEqual:
            view.centerYAnchor.constraint(lessThanOrEqualTo: anchor, constant: offset).isActive = true
        }
        
        return self
    }
    
    @discardableResult
    func top(to anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0, type: ConstaintType = .equal) -> Self {
        removeConstraint(with: .top)

        switch type {
        case .equal:
            view.topAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
        case .greaterThanOrEqual:
            view.topAnchor.constraint(greaterThanOrEqualTo: anchor, constant: offset).isActive = true
        case .lessThanOrEqual:
            view.topAnchor.constraint(lessThanOrEqualTo: anchor, constant: offset).isActive = true
        }
        
        return self
    }
    
    @discardableResult
    func bottom(to anchor: NSLayoutYAxisAnchor, offset: CGFloat = 0, type: ConstaintType = .equal) -> Self {
        removeConstraint(with: .bottom)

        switch type {
        case .equal:
            view.bottomAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
        case .greaterThanOrEqual:
            view.bottomAnchor.constraint(greaterThanOrEqualTo: anchor, constant: offset).isActive = true
        case .lessThanOrEqual:
            view.bottomAnchor.constraint(lessThanOrEqualTo: anchor, constant: offset).isActive = true
        }
        
        return self
    }
    
    @discardableResult
    func leading(to anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0, type: ConstaintType = .equal) -> Self {
        removeConstraint(with: .leading)

        switch type {
        case .equal:
            view.leadingAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
        case .greaterThanOrEqual:
            view.leadingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: offset).isActive = true
        case .lessThanOrEqual:
            view.leadingAnchor.constraint(lessThanOrEqualTo: anchor, constant: offset).isActive = true
        }
        
        return self
    }
    
    @discardableResult
    func trailing(to anchor: NSLayoutXAxisAnchor, offset: CGFloat = 0, type: ConstaintType = .equal) -> Self {
        removeConstraint(with: .trailing)

        switch type {
        case .equal:
            view.trailingAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
        case .greaterThanOrEqual:
            view.trailingAnchor.constraint(greaterThanOrEqualTo: anchor, constant: offset).isActive = true
        case .lessThanOrEqual:
            view.trailingAnchor.constraint(lessThanOrEqualTo: anchor, constant: offset).isActive = true
        }
        
        return self
    }
}

// MARK: - With safe area
public extension AppLayout {
    
    @discardableResult
    func topToSafeArea(of view: UIView, offset: CGFloat = 0, type: ConstaintType = .equal) -> Self {
        removeConstraint(with: .top)

        switch type {
        case .equal:
            view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: offset).isActive = true
        case .greaterThanOrEqual:
            view.topAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: offset).isActive = true
        case .lessThanOrEqual:
            view.topAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: offset).isActive = true
        }
        
        return self
    }
    
    @discardableResult
    func bottomToSafeArea(of view: UIView, offset: CGFloat = 0, type: ConstaintType = .equal) -> Self {
        removeConstraint(with: .bottom)

        switch type {
        case .equal:
            view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: offset).isActive = true
        case .greaterThanOrEqual:
            view.bottomAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: offset).isActive = true
        case .lessThanOrEqual:
            view.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: offset).isActive = true
        }
        
        return self
    }
    
    @discardableResult
    func leadingToSafeArea(of view: UIView, offset: CGFloat = 0, type: ConstaintType = .equal) -> Self {
        removeConstraint(with: .leading)

        switch type {
        case .equal:
            view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: offset).isActive = true
        case .greaterThanOrEqual:
            view.leadingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor, constant: offset).isActive = true
        case .lessThanOrEqual:
            view.leadingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor, constant: offset).isActive = true
        }
        
        return self
    }
    
    @discardableResult
    func trailingToSafeArea(of view: UIView, offset: CGFloat = 0, type: ConstaintType = .equal) -> Self {
        removeConstraint(with: .trailing)

        switch type {
        case .equal:
            view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: offset).isActive = true
        case .greaterThanOrEqual:
            view.trailingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: offset).isActive = true
        case .lessThanOrEqual:
            view.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: offset).isActive = true
        }
        
        return self
    }
}

#endif
