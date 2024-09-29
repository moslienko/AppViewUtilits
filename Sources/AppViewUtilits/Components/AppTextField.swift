//
//  AppTextField.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 19.07.2024.
//  Copyright © 2024 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit

/// Subclass `UITextField`.
public class AppTextField: UITextField {
    
    // MARK: - Params
    public var textInsets = UIEdgeInsets.zero {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var maxCharacters: Int?
    
    // MARK: - Callbacks
    public var didTextChanged: DataCallback<String>?
    public var didBeginEditing: DataCallback<UITextField>?
    public var didEndEditing: DataCallback<UITextField>?
    public var shouldBeginEditing: ReturnedDataCallback<UITextField, Bool>?
    public var shouldEndEditing: ReturnedDataCallback<UITextField, Bool>?
    public var shouldClear: ReturnedDataCallback<UITextField, Bool>?
    public var shouldReturn: ReturnedDataCallback<UITextField, Bool>?
    public var shouldChangeCharactersIn: ReturnedDataCallback<(UITextField, NSRange, String), Bool>?
    
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
        self.commonInit()
    }
    
    convenience public init(
        didTextChanged: DataCallback<String>?,
        didBeginEditing: DataCallback<UITextField>? = nil,
        didEndEditing: DataCallback<UITextField>? = nil,
        shouldBeginEditing: ReturnedDataCallback<UITextField, Bool>? = nil,
        shouldClear: ReturnedDataCallback<UITextField, Bool>? = nil,
        shouldReturn: ReturnedDataCallback<UITextField, Bool>? = nil,
        shouldChangeCharactersIn: ReturnedDataCallback<(UITextField, NSRange, String), Bool>? = nil
    ) {
        self.init(frame: .zero)
        self.didTextChanged = didTextChanged
        self.didBeginEditing = didBeginEditing
        self.didEndEditing = didEndEditing
        self.shouldBeginEditing = shouldBeginEditing
        self.shouldClear = shouldClear
        self.shouldReturn = shouldReturn
        self.shouldChangeCharactersIn = shouldChangeCharactersIn
        
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.commonInit()
    }
    
    private func commonInit() {
        self.delegate = self
    }
}

// MARK: - UITextFieldDelegate
extension AppTextField: UITextFieldDelegate {
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
        if let maxCharacters = maxCharacters {
            if maxCharacters > 0 && newText.count > maxCharacters {
                return false
            }
            return true
        }
        let shouldChangeCharacters = shouldChangeCharactersIn?((self, range, string)) ?? true
        if shouldChangeCharacters {
            didTextChanged?(newText)
        }
        return shouldChangeCharacters
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        didBeginEditing?(textField)
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        didEndEditing?(textField)
    }
    
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        shouldBeginEditing?(textField) ?? true
    }
    
    public func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        shouldEndEditing?(textField) ?? true
    }
    
    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        shouldClear?(textField) ?? true
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        shouldReturn?(textField) ?? true
    }
}

#endif
