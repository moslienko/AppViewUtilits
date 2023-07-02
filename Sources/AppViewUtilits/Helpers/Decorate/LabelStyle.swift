//
//  LabelStyle.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 25.06.2023.
//  Copyright © 2023 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#endif

public struct LabelStyle {
    var textColor: UIColor
    var font: UIFont
    var textAlignment: NSTextAlignment
    var backgroundColor: UIColor
    var shadowColor: UIColor?
    var shadowOffset: CGSize
    var allowsDefaultTighteningForTruncation: Bool
    var minimumScaleFactor: CGFloat
    var adjustsFontSizeToFitWidth: Bool
    var baselineAdjustment: UIBaselineAdjustment
    var numberOfLines: Int
    var highlightedTextColor: UIColor?
    var disabledTextColor: UIColor?
    var isHighlighted: Bool
    var isEnabled: Bool
    var isUserInteractionEnabled: Bool
    var preferredMaxLayoutWidth: CGFloat
    var lineBreakMode: NSLineBreakMode
    var highlightedBackgroundColor: UIColor?
    var disabledBackgroundColor: UIColor?
    var adjustsFontForContentSizeCategory: Bool
    
    init(textColor: UIColor = .black,
         font: UIFont = .systemFont(ofSize: 17.0),
         textAlignment: NSTextAlignment = .left,
         backgroundColor: UIColor = .clear,
         shadowColor: UIColor? = nil,
         shadowOffset: CGSize = .zero,
         allowsDefaultTighteningForTruncation: Bool = true,
         minimumScaleFactor: CGFloat = 0.0,
         adjustsFontSizeToFitWidth: Bool = false,
         baselineAdjustment: UIBaselineAdjustment = .alignBaselines,
         numberOfLines: Int = 1,
         highlightedTextColor: UIColor? = nil,
         disabledTextColor: UIColor? = nil,
         isHighlighted: Bool = false,
         isEnabled: Bool = true,
         isUserInteractionEnabled: Bool = true,
         preferredMaxLayoutWidth: CGFloat = 0,
         lineBreakMode: NSLineBreakMode = .byTruncatingTail,
         highlightedBackgroundColor: UIColor? = nil,
         disabledBackgroundColor: UIColor? = nil,
         adjustsFontForContentSizeCategory: Bool = false) {
        self.textColor = textColor
        self.font = font
        self.textAlignment = textAlignment
        self.backgroundColor = backgroundColor
        self.shadowColor = shadowColor
        self.shadowOffset = shadowOffset
        self.allowsDefaultTighteningForTruncation = allowsDefaultTighteningForTruncation
        self.minimumScaleFactor = minimumScaleFactor
        self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
        self.baselineAdjustment = baselineAdjustment
        self.numberOfLines = numberOfLines
        self.highlightedTextColor = highlightedTextColor
        self.disabledTextColor = disabledTextColor
        self.isHighlighted = isHighlighted
        self.isEnabled = isEnabled
        self.isUserInteractionEnabled = isUserInteractionEnabled
        self.preferredMaxLayoutWidth = preferredMaxLayoutWidth
        self.lineBreakMode = lineBreakMode
        self.highlightedBackgroundColor = highlightedBackgroundColor
        self.disabledBackgroundColor = disabledBackgroundColor
        self.adjustsFontForContentSizeCategory = adjustsFontForContentSizeCategory
    }
    
    func apply(to label: UILabel) {
        label.textColor = textColor
        label.font = font
        label.textAlignment = textAlignment
        label.backgroundColor = backgroundColor
        label.shadowColor = shadowColor
        label.shadowOffset = shadowOffset
        label.allowsDefaultTighteningForTruncation = allowsDefaultTighteningForTruncation
        label.minimumScaleFactor = minimumScaleFactor
        label.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
        label.baselineAdjustment = baselineAdjustment
        label.numberOfLines = numberOfLines
        label.isHighlighted = isHighlighted
        label.isEnabled = isEnabled
        label.isUserInteractionEnabled = isUserInteractionEnabled
        label.highlightedTextColor = highlightedTextColor
        label.preferredMaxLayoutWidth = preferredMaxLayoutWidth
        label.lineBreakMode = lineBreakMode
        label.adjustsFontForContentSizeCategory = adjustsFontForContentSizeCategory
    }
}
