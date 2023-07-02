//
//  ViewStyle.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 25.06.2023.
//  Copyright © 2023 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#endif

public struct ViewStyle {
    var backgroundColor: UIColor
    var tintColor: UIColor?
    var cornerRadius: CGFloat
    var borderWidth: CGFloat
    var borderColor: UIColor
    var isHidden: Bool
    var isOpaque: Bool
    var alpha: CGFloat
    var clipsToBounds: Bool
    var isUserInteractionEnabled: Bool
    var contentMode: UIView.ContentMode
    var semanticContentAttribute: UISemanticContentAttribute
    var transform: CGAffineTransform
    var autoresizesSubviews: Bool
    var autoresizingMask: UIView.AutoresizingMask
    var tag: Int
    var accessibilityLabel: String?
    var accessibilityIdentifier: String?
    var accessibilityTraits: UIAccessibilityTraits
    var accessibilityValue: String?
    var preservesSuperviewLayoutMargins: Bool
    var insetsLayoutMarginsFromSafeArea: Bool
    var directionalLayoutMargins: NSDirectionalEdgeInsets
    var layoutMargins: UIEdgeInsets
    var contentScaleFactor: CGFloat
    var accessibilityAttributedLabel: NSAttributedString?
    var accessibilityHint: String?
    var accessibilityLanguage: String?
    var accessibilityElementsHidden: Bool
    var isMultipleTouchEnabled: Bool
    var isExclusiveTouch: Bool
    var gestureRecognizers: [UIGestureRecognizer]
    var restorationIdentifier: String?
    var masksToBounds: Bool
    var mask: CALayer?
    
    init(backgroundColor: UIColor = .clear,
         tintColor: UIColor? = nil,
         cornerRadius: CGFloat = 0,
         borderWidth: CGFloat = 0,
         borderColor: UIColor = .clear,
         isHidden: Bool = false,
         isOpaque: Bool = true,
         alpha: CGFloat = 1.0,
         clipsToBounds: Bool = false,
         isUserInteractionEnabled: Bool = true,
         contentMode: UIView.ContentMode = .scaleToFill,
         semanticContentAttribute: UISemanticContentAttribute = .unspecified,
         transform: CGAffineTransform = .identity,
         autoresizesSubviews: Bool = true,
         autoresizingMask: UIView.AutoresizingMask = .flexibleWidth,
         tag: Int = 0,
         accessibilityLabel: String? = nil,
         accessibilityIdentifier: String? = nil,
         accessibilityTraits: UIAccessibilityTraits = .none,
         accessibilityValue: String? = nil,
         preservesSuperviewLayoutMargins: Bool = true,
         insetsLayoutMarginsFromSafeArea: Bool = false,
         directionalLayoutMargins: NSDirectionalEdgeInsets = .zero,
         layoutMargins: UIEdgeInsets = .zero,
         contentScaleFactor: CGFloat = UIScreen.main.scale,
         accessibilityAttributedLabel: NSAttributedString? = nil,
         accessibilityHint: String? = nil,
         accessibilityLanguage: String? = nil,
         accessibilityElementsHidden: Bool = false,
         isMultipleTouchEnabled: Bool = false,
         isExclusiveTouch: Bool = false,
         gestureRecognizers: [UIGestureRecognizer] = [],
         restorationIdentifier: String? = nil,
         masksToBounds: Bool = false,
         mask: CALayer? = nil) {
        self.backgroundColor = backgroundColor
        self.tintColor = tintColor
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.borderColor = borderColor
        self.isHidden = isHidden
        self.isOpaque = isOpaque
        self.alpha = alpha
        self.clipsToBounds = clipsToBounds
        self.isUserInteractionEnabled = isUserInteractionEnabled
        self.contentMode = contentMode
        self.semanticContentAttribute = semanticContentAttribute
        self.transform = transform
        self.autoresizesSubviews = autoresizesSubviews
        self.autoresizingMask = autoresizingMask
        self.tag = tag
        self.accessibilityLabel = accessibilityLabel
        self.accessibilityIdentifier = accessibilityIdentifier
        self.accessibilityTraits = accessibilityTraits
        self.accessibilityValue = accessibilityValue
        self.preservesSuperviewLayoutMargins = preservesSuperviewLayoutMargins
        self.insetsLayoutMarginsFromSafeArea = insetsLayoutMarginsFromSafeArea
        self.directionalLayoutMargins = directionalLayoutMargins
        self.layoutMargins = layoutMargins
        self.contentScaleFactor = contentScaleFactor
        self.accessibilityAttributedLabel = accessibilityAttributedLabel
        self.accessibilityHint = accessibilityHint
        self.accessibilityLanguage = accessibilityLanguage
        self.accessibilityElementsHidden = accessibilityElementsHidden
        self.isMultipleTouchEnabled = isMultipleTouchEnabled
        self.isExclusiveTouch = isExclusiveTouch
        self.gestureRecognizers = gestureRecognizers
        self.restorationIdentifier = restorationIdentifier
        self.masksToBounds = masksToBounds
        self.mask = mask
    }
    
    func apply(to view: UIView) {
        view.backgroundColor = backgroundColor
        view.tintColor = tintColor
        view.layer.cornerRadius = cornerRadius
        view.layer.borderWidth = borderWidth
        view.layer.borderColor = borderColor.cgColor
        view.isHidden = isHidden
        view.isOpaque = isOpaque
        view.alpha = alpha
        view.clipsToBounds = clipsToBounds
        view.isUserInteractionEnabled = isUserInteractionEnabled
        view.contentMode = contentMode
        view.semanticContentAttribute = semanticContentAttribute
        view.transform = transform
        view.autoresizesSubviews = autoresizesSubviews
        view.autoresizingMask = autoresizingMask
        view.tag = tag
        view.accessibilityLabel = accessibilityLabel
        view.accessibilityIdentifier = accessibilityIdentifier
        view.accessibilityTraits = accessibilityTraits
        view.accessibilityValue = accessibilityValue
        view.preservesSuperviewLayoutMargins = preservesSuperviewLayoutMargins
        view.insetsLayoutMarginsFromSafeArea = insetsLayoutMarginsFromSafeArea
        view.directionalLayoutMargins = directionalLayoutMargins
        view.layoutMargins = layoutMargins
        view.contentScaleFactor = contentScaleFactor
        view.accessibilityAttributedLabel = accessibilityAttributedLabel
        view.accessibilityHint = accessibilityHint
        view.accessibilityLanguage = accessibilityLanguage
        view.accessibilityElementsHidden = accessibilityElementsHidden
        view.isMultipleTouchEnabled = isMultipleTouchEnabled
        view.isExclusiveTouch = isExclusiveTouch
        view.gestureRecognizers = gestureRecognizers
        view.restorationIdentifier = restorationIdentifier
        view.layer.masksToBounds = masksToBounds
        view.layer.mask = mask
    }
}
