//
//  AppButton.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 25.06.2023.
//  Copyright © 2023 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#endif

public class AppButton: UIButton {
    
    private var action: Callback?
    private var didHighlight: Callback?
    private var didUnhighlight: Callback?
    
    public var regularStyle: DecorateWrapper<AppButton>? {
        didSet {
            setupStyle()
        }
    }
    public var disabledStyle: DecorateWrapper<AppButton>?
    public var highlightedStyle: DecorateWrapper<AppButton>?
    
    public override var isEnabled: Bool {
        get {
            super.isEnabled
        }
        set(isEnabled) {
            super.isEnabled = isEnabled
            setupStyle()
        }
    }
    
    override open var isHighlighted: Bool {
        get {
            super.isHighlighted
        }
        set(isHighlighted) {
            super.isHighlighted = isHighlighted
            setupStyle()
        }
    }
    
    public override var isSelected: Bool {
        get {
            super.isSelected
        }
        set(isSelected) {
            super.isSelected = isSelected
            setupStyle()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    convenience public init(title: String, disabledTitle: String? = nil) {
        self.init(frame: .zero)
        if let disabledTitle = disabledTitle {
            setTitle(title, for: [.normal, .focused, .application, .highlighted, .reserved, .selected])
            setTitle(disabledTitle, for: [.disabled])
        } else {
            setTitle(title, for: [])
        }
    }
    
    public func addAction(_ action: @escaping Callback) {
        self.action = action
        addTarget(
            self,
            action: #selector(didTap),
            for: .touchUpInside
        )
    }
    
    public func addTapAnimation(didHighlight: @escaping Callback, didUnhighlight: @escaping Callback) {
        self.didHighlight = didHighlight
        self.didUnhighlight = didUnhighlight
        addTarget(
            self,
            action: #selector(animateDown),
            for: [.touchDown, .touchDragEnter]
        )
        addTarget(
            self,
            action: #selector(animateUp),
            for: [.touchDragExit, .touchCancel, .touchUpOutside, .touchUpInside]
        )
    }
    
    private func setupStyle() {
        if !isEnabled {
            if let style = disabledStyle {
                apply(style)
            }
        } else {
            if let style = regularStyle {
                apply(style)
            }
        }
        
        if isHighlighted, let style = highlightedStyle {
            apply(style)
        }
    }
    
    @objc
    private func didTap() {
        action?()
    }
    
    @objc
    private func animateDown(sender: UIButton) {
        didHighlight?()
    }
    
    @objc
    private func animateUp(sender: UIButton) {
        didUnhighlight?()
    }
}
