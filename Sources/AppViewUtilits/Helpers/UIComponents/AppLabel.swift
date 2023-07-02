//
//  AppLabel.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 25.06.2023.
//  Copyright © 2023 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#endif

public class AppLabel: UILabel, LabelDecorate {
    
    public var labelStyle: LabelStyle? {
        didSet {
            labelStyle?.apply(to: self)
        }
    }
    
    public override var isEnabled: Bool {
        get {
            super.isEnabled
        }
        set(isEnabled) {
            super.isEnabled = isEnabled
            
            textColor = isEnabled ? labelStyle?.textColor : labelStyle?.disabledTextColor
            backgroundColor =  isHighlighted ? labelStyle?.backgroundColor : labelStyle?.disabledBackgroundColor
        }
    }
    
    override open var isHighlighted: Bool {
        get {
            super.isHighlighted
        }
        set(isHighlighted) {
            super.isHighlighted = isHighlighted
            
            textColor = isHighlighted ? labelStyle?.highlightedTextColor : labelStyle?.textColor
            backgroundColor =  isHighlighted ? labelStyle?.highlightedBackgroundColor : labelStyle?.backgroundColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(text: String, style: LabelStyle) {
        self.init(frame: .zero)
        self.text = text
        self.labelStyle = style
    }
}
