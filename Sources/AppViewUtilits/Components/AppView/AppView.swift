//
//  AppView.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 31.10.2020.
//  Copyright © 2021 moslienko. All rights reserved.
//

import Foundation
#if canImport(UIKit)
import UIKit

public protocol AppViewDelegate {
    var model: AppViewModel? { get set }
    
    func updateView()
    
    func setupComponents()
    func setupActions()
    func applyStyles()
}

open class AppView: UIView, AppViewDelegate {
    
    public var model: AppViewModel? {
        didSet {
            self.updateView()
        }
    }
    
    // Actions
    private var tapAction: DataCallback<CGPoint>?
    private var doubleTapAction: DataCallback<CGPoint>?
    private var longPressAction: DataCallback<UILongPressGestureRecognizer>?
    private var panAction: DataCallback<UIPanGestureRecognizer>?
    private var swipeActions: DataCallback<UISwipeGestureRecognizer.Direction>?
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setupActions()
        self.setupComponents()
        self.applyStyles()
    }
    
    open override func awakeAfter(using aDecoder: NSCoder) -> Any? {
        return self.loadFromNibIfEmbeddedInDifferentNib()
    }
    
    open func updateView() {}
    open func setupComponents() {}
    open func setupActions() {}
    open func applyStyles() {}
}

//MARK: - Touch events
public extension AppView {
    
    @discardableResult
    func addTap(_ action: @escaping DataCallback<CGPoint>) -> UITapGestureRecognizer {
        tapAction = action
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
        addGestureRecognizer(tapGesture)
        isUserInteractionEnabled = true
        
        return tapGesture
    }
    
    @discardableResult
    func addDoubleTap(_ action: @escaping DataCallback<CGPoint>) -> UITapGestureRecognizer {
        doubleTapAction = action
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didDoubleTap))
        tapGesture.numberOfTapsRequired = 2
        addGestureRecognizer(tapGesture)
        isUserInteractionEnabled = true
        
        return tapGesture
    }
    
    @discardableResult
    func addLongPress(minimumPressDuration: TimeInterval = 0, action: @escaping DataCallback<UILongPressGestureRecognizer>) -> UILongPressGestureRecognizer {
        longPressAction = action
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(didLongPress))
        gesture.minimumPressDuration = minimumPressDuration
        addGestureRecognizer(gesture)
        isUserInteractionEnabled = true
        
        return gesture
    }
    
    @discardableResult
    func addPan(_ panAction: @escaping DataCallback<UIPanGestureRecognizer>) -> UIPanGestureRecognizer {
        self.panAction = panAction
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(didPan))
        addGestureRecognizer(panGesture)
        isUserInteractionEnabled = true
        
        return panGesture
    }
    
    @discardableResult
    func addSwipeGestureRecognizer(directions: UISwipeGestureRecognizer.Direction, action: @escaping DataCallback<UISwipeGestureRecognizer.Direction>) -> UISwipeGestureRecognizer {
        swipeActions = action
        let gestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
        gestureRecognizer.numberOfTouchesRequired = 1
        gestureRecognizer.direction = directions
        addGestureRecognizer(gestureRecognizer)
        isUserInteractionEnabled = true
        
        return gestureRecognizer
    }
}

//MARK: - Actions
private extension AppView {
    
    @objc
    func didTap(_ gesture: UITapGestureRecognizer) {
        let touchPoint = gesture.location(in: self)
        tapAction?(touchPoint)
    }
    
    @objc
    func didDoubleTap(_ gesture: UITapGestureRecognizer) {
        let touchPoint = gesture.location(in: self)
        doubleTapAction?(touchPoint)
    }
    
    @objc
    func didLongPress(_ gesture: UILongPressGestureRecognizer) {
        longPressAction?(gesture)
    }
    
    @objc
    func didPan(_ gesture: UIPanGestureRecognizer) {
        panAction?(gesture)
    }
    
    @objc
    func didSwipe(_ gesture: UISwipeGestureRecognizer) {
        swipeActions?(gesture.direction)
    }
}

#endif
