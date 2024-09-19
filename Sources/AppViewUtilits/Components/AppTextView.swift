//
//  AppTextView.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 19.07.2024.
//  Copyright © 2024 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public class AppTextView: UITextField {
    
    // MARK: - Params
    public var maxCharacters: Int?
    
    // MARK: - Callbacks
    public var didTextChanged: ((String) -> Void)?
    public var didBeginEditing: ((UITextField) -> Void)?
    public var didEndEditing: ((UITextField) -> Void)?
    public var shouldBeginEditing: ((UITextField) -> Bool)?
    public var shouldEndEditing: ((UITextField) -> Bool)?
    public var shouldClear: ((UITextField) -> Bool)?
    public var shouldReturn: ((UITextField) -> Bool)?
    public var shouldChangeCharactersIn: ((UITextField, NSRange, String) -> Bool)?
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.delegate = self
    }
    
    // MARK: - Init
    convenience public init(
        didTextChanged: ((String) -> Void)? = nil,
        didBeginEditing: ((UITextField) -> Void)? = nil,
        didEndEditing: ((UITextField) -> Void)? = nil,
        shouldBeginEditing: ((UITextField) -> Bool)? = nil,
        shouldClear: ((UITextField) -> Bool)? = nil,
        shouldReturn: ((UITextField) -> Bool)? = nil,
        shouldChangeCharactersIn: ((UITextField, NSRange, String) -> Bool)?  = nil
    ) {
        self.init(frame: .zero)
        self.didTextChanged = didTextChanged
        self.didBeginEditing = didBeginEditing
        self.didEndEditing = didEndEditing
        self.shouldBeginEditing = shouldBeginEditing
        self.shouldClear = shouldClear
        self.shouldReturn = shouldReturn
        self.shouldChangeCharactersIn = shouldChangeCharactersIn
    }
}

// MARK: - UITextFieldDelegate
extension AppTextView: UITextFieldDelegate {
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
        if let maxCharacters = maxCharacters {
            if maxCharacters > 0 && newText.count > maxCharacters {
                return false
            }
            return true
        }
        let shouldChangeCharacters = shouldChangeCharactersIn?(self, range, string) ?? true
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
