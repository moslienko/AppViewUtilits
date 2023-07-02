//
//  ButtonStyle.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 25.06.2023.
//  Copyright © 2023 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#endif

public struct ButtonStyle {
    var titleColor: UIColor
    var backgroundColor: UIColor
    var borderColor: UIColor
    var borderWidth: CGFloat
    var cornerRadius: CGFloat
    var font: UIFont
    var shadowColor: UIColor?
    var shadowOffset: CGSize
    var shadowOpacity: Float
    var shadowRadius: CGFloat
    var contentEdgeInsets: UIEdgeInsets
    var imageEdgeInsets: UIEdgeInsets
    var titleEdgeInsets: UIEdgeInsets
    var image: UIImage?
    var disabledTitleColor: UIColor?
    var highlightedBackgroundColor: UIColor?
    var selectedBackgroundColor: UIColor?
    var disabledBackgroundColor: UIColor?
    var disabledBorderColor: UIColor?
    var selectedBorderColor: UIColor?
    var highlightedBorderColor: UIColor?
    var disabledImage: UIImage?
    var highlightedImage: UIImage?
    var selectedImage: UIImage?
    var adjustsImageWhenHighlighted: Bool
    var adjustsImageWhenDisabled: Bool
    
    init(titleColor: UIColor = .white,
         backgroundColor: UIColor = .blue,
         borderColor: UIColor = .clear,
         borderWidth: CGFloat = 0.0,
         cornerRadius: CGFloat = 0.0,
         font: UIFont = .systemFont(ofSize: 17.0),
         shadowColor: UIColor? = nil,
         shadowOffset: CGSize = .zero,
         shadowOpacity: Float = 0.0,
         shadowRadius: CGFloat = 0.0,
         contentEdgeInsets: UIEdgeInsets = .zero,
         imageEdgeInsets: UIEdgeInsets = .zero,
         titleEdgeInsets: UIEdgeInsets = .zero,
         image: UIImage? = nil,
         disabledTitleColor: UIColor? = nil,
         highlightedBackgroundColor: UIColor? = nil,
         selectedBackgroundColor: UIColor? = nil,
         disabledBackgroundColor: UIColor? = nil,
         disabledBorderColor: UIColor? = nil,
         selectedBorderColor: UIColor? = nil,
         highlightedBorderColor: UIColor? = nil,
         disabledImage: UIImage? = nil,
         highlightedImage: UIImage? = nil,
         selectedImage: UIImage? = nil,
         adjustsImageWhenHighlighted: Bool = false,
         adjustsImageWhenDisabled: Bool = false) {
        self.titleColor = titleColor
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.cornerRadius = cornerRadius
        self.font = font
        self.shadowColor = shadowColor
        self.shadowOffset = shadowOffset
        self.shadowOpacity = shadowOpacity
        self.shadowRadius = shadowRadius
        self.contentEdgeInsets = contentEdgeInsets
        self.imageEdgeInsets = imageEdgeInsets
        self.titleEdgeInsets = titleEdgeInsets
        self.image = image
        self.disabledTitleColor = disabledTitleColor
        self.highlightedBackgroundColor = highlightedBackgroundColor
        self.selectedBackgroundColor = selectedBackgroundColor
        self.disabledBackgroundColor = disabledBackgroundColor
        self.disabledBorderColor = disabledBorderColor
        self.selectedBorderColor = selectedBorderColor
        self.highlightedBorderColor = highlightedBorderColor
        self.disabledImage = disabledImage
        self.highlightedImage = highlightedImage
        self.selectedImage = selectedImage
        self.adjustsImageWhenHighlighted = adjustsImageWhenHighlighted
        self.adjustsImageWhenDisabled = adjustsImageWhenDisabled
    }
    
    func apply(to button: UIButton) {
        button.setTitleColor(titleColor, for: .normal)
        button.backgroundColor = backgroundColor
        button.layer.borderColor = borderColor.cgColor
        button.layer.borderWidth = borderWidth
        button.layer.cornerRadius = cornerRadius
        button.titleLabel?.font = font

        if let shadowColor = shadowColor {
            button.layer.shadowColor = shadowColor.cgColor
            button.layer.shadowOffset = shadowOffset
            button.layer.shadowOpacity = shadowOpacity
            button.layer.shadowRadius = shadowRadius
        }
        
        button.contentEdgeInsets = contentEdgeInsets
        button.imageEdgeInsets = imageEdgeInsets
        button.titleEdgeInsets = titleEdgeInsets
        button.setImage(image, for: .normal)
        
        if let disabledTitleColor = disabledTitleColor {
            button.setTitleColor(disabledTitleColor, for: .disabled)
        }
        
        if let disabledImage = disabledImage {
            button.setImage(disabledImage, for: .disabled)
        }
        
        if let highlightedImage = highlightedImage {
            button.setImage(highlightedImage, for: .highlighted)
        }
        
        if let selectedImage = selectedImage {
            button.setImage(selectedImage, for: .selected)
        }
        
        button.adjustsImageWhenHighlighted = adjustsImageWhenHighlighted
        button.adjustsImageWhenDisabled = adjustsImageWhenDisabled
    }
}
