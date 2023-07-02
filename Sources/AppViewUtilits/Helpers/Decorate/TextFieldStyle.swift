//
//  TextFieldStyle.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 02.07.2023.
//  Copyright © 2023 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#endif

public struct TextFieldStyle {
    var textColor: UIColor
    var font: UIFont
    var backgroundColor: UIColor
    var cornerRadius: CGFloat
    var borderWidth: CGFloat
    var borderColor: UIColor
    var placeholder: String?
    var attributedPlaceholder: NSAttributedString?
    var clearButtonMode: UITextField.ViewMode
    var leftView: UIView?
    var leftViewMode: UITextField.ViewMode
    var rightView: UIView?
    var rightViewMode: UITextField.ViewMode
    var keyboardType: UIKeyboardType
    var returnKeyType: UIReturnKeyType
    var isSecureTextEntry: Bool
    var autocapitalizationType: UITextAutocapitalizationType
    var autocorrectionType: UITextAutocorrectionType
    var borderStyle: UITextField.BorderStyle
    var enablesReturnKeyAutomatically: Bool
    var contentVerticalAlignment: UIControl.ContentVerticalAlignment
    var contentHorizontalAlignment: UIControl.ContentHorizontalAlignment
    var clearsOnBeginEditing: Bool
    
    init(textColor: UIColor = .black,
         font: UIFont = .systemFont(ofSize: 17.0),
         backgroundColor: UIColor = .clear,
         cornerRadius: CGFloat = 0.0,
         borderWidth: CGFloat = 0.0,
         borderColor: UIColor = .clear,
         placeholder: String? = nil,
         attributedPlaceholder: NSAttributedString? = nil,
         clearButtonMode: UITextField.ViewMode = .never,
         leftView: UIView? = nil,
         leftViewMode: UITextField.ViewMode = .never,
         rightView: UIView? = nil,
         rightViewMode: UITextField.ViewMode = .never,
         keyboardType: UIKeyboardType = .default,
         returnKeyType: UIReturnKeyType = .default,
         isSecureTextEntry: Bool = false,
         autocapitalizationType: UITextAutocapitalizationType = .sentences,
         autocorrectionType: UITextAutocorrectionType = .default,
         borderStyle: UITextField.BorderStyle = .none,
         enablesReturnKeyAutomatically: Bool = false,
         contentVerticalAlignment: UIControl.ContentVerticalAlignment = .center,
         contentHorizontalAlignment: UIControl.ContentHorizontalAlignment = .left,
         clearsOnBeginEditing: Bool = false) {
        self.textColor = textColor
        self.font = font
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.borderColor = borderColor
        self.placeholder = placeholder
        self.attributedPlaceholder = attributedPlaceholder
        self.clearButtonMode = clearButtonMode
        self.leftView = leftView
        self.leftViewMode = leftViewMode
        self.rightView = rightView
        self.rightViewMode = rightViewMode
        self.keyboardType = keyboardType
        self.returnKeyType = returnKeyType
        self.isSecureTextEntry = isSecureTextEntry
        self.autocapitalizationType = autocapitalizationType
        self.autocorrectionType = autocorrectionType
        self.borderStyle = borderStyle
        self.enablesReturnKeyAutomatically = enablesReturnKeyAutomatically
        self.contentVerticalAlignment = contentVerticalAlignment
        self.contentHorizontalAlignment = contentHorizontalAlignment
        self.clearsOnBeginEditing = clearsOnBeginEditing
    }
    
    func apply(to textField: UITextField) {
        textField.textColor = textColor
        textField.font = font
        textField.backgroundColor = backgroundColor
        textField.layer.cornerRadius = cornerRadius
        textField.layer.borderWidth = borderWidth
        textField.layer.borderColor = borderColor.cgColor
        textField.placeholder = placeholder
        textField.attributedPlaceholder = attributedPlaceholder
        textField.clearButtonMode = clearButtonMode
        textField.leftView = leftView
        textField.leftViewMode = leftViewMode
        textField.rightView = rightView
        textField.rightViewMode = rightViewMode
        textField.keyboardType = keyboardType
        textField.returnKeyType = returnKeyType
        textField.isSecureTextEntry = isSecureTextEntry
        textField.autocapitalizationType = autocapitalizationType
        textField.autocorrectionType = autocorrectionType
        textField.borderStyle = borderStyle
        textField.enablesReturnKeyAutomatically = enablesReturnKeyAutomatically
        textField.contentVerticalAlignment = contentVerticalAlignment
        textField.contentHorizontalAlignment = contentHorizontalAlignment
        textField.clearsOnBeginEditing = clearsOnBeginEditing
    }
}
