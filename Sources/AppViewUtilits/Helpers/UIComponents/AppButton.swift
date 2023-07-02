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

public class AppButton: UIButton, ButtonDecorate {
    
    private var action: Callback?
    private var didHighlight: Callback?
    private var didUnhighlight: Callback?
    
    public var buttonStyle: ButtonStyle? {
        didSet {
            buttonStyle?.apply(to: self)
        }
    }
    
    public override var isEnabled: Bool {
        get {
            super.isEnabled
        }
        set(isEnabled) {
            super.isEnabled = isEnabled
            
            setTitleColor(isEnabled ? buttonStyle?.titleColor : buttonStyle?.disabledTitleColor, for: .normal)
            backgroundColor = isEnabled ? buttonStyle?.backgroundColor : buttonStyle?.disabledBackgroundColor
            layer.borderColor = isEnabled ? buttonStyle?.borderColor.cgColor : buttonStyle?.disabledBorderColor?.cgColor
        }
    }
    
    override open var isHighlighted: Bool {
        get {
            super.isHighlighted
        }
        set(isHighlighted) {
            super.isHighlighted = isHighlighted
            
            backgroundColor = isHighlighted ? buttonStyle?.highlightedBackgroundColor : buttonStyle?.backgroundColor
            layer.borderColor = isHighlighted ? buttonStyle?.highlightedBorderColor?.cgColor : buttonStyle?.borderColor.cgColor
        }
    }
    
    public override var isSelected: Bool {
        get {
            super.isSelected
        }
        set(isSelected) {
            super.isSelected = isSelected
            
            backgroundColor = isSelected ? buttonStyle?.selectedBackgroundColor : buttonStyle?.backgroundColor
            layer.borderColor = isEnabled ? buttonStyle?.selectedBorderColor?.cgColor : buttonStyle?.highlightedBorderColor?.cgColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String, style: ButtonStyle) {
        self.init(frame: .zero)
        setTitle(title, for: [])
        self.buttonStyle = style
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
