//
//  AppTextField.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 19.07.2024.
//  Copyright © 2024 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public class AppTextField: UITextField {
    
    // MARK: - Params
    public var textInsets = UIEdgeInsets.zero {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // MARK: - Callbacks
    public var didTextChanged: ((String) -> Void)?
    
    open override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: textInsets)
    }
    
    open override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: textInsets)
    }
    
    open override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: textInsets)
    }
    
    open override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textInsets))
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addTarget(self, action: #selector(didChangeTextFieldText), for: .editingChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Actions
private extension AppTextField {
    
    @objc
    func didChangeTextFieldText(_ textField: UITextField) {
        didTextChanged?(textField.text ?? "")
    }
}

#endif
