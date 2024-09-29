//
//  AppTextView.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 19.07.2024.
//  Copyright © 2024 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit

/// Subclass `UITextView`.
public class AppTextView: UITextView {
    
    // MARK: - Params
    public var maxCharacters: Int?
    
    // MARK: - Callbacks
    public var didTextChanged: DataCallback<String>?
    public var didBeginEditing: DataCallback<UITextView>?
    public var didEndEditing: DataCallback<UITextView>?
    public var shouldBeginEditing: ReturnedDataCallback<UITextView, Bool>?
    public var shouldEndEditing: ReturnedDataCallback<UITextView, Bool>?
    public var shouldChangeTextIn: ReturnedDataCallback<(UITextView, NSRange, String), Bool>?
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.delegate = self
    }
    
    // MARK: - Init
    convenience public init(
        didTextChanged: DataCallback<String>? = nil,
        didBeginEditing: DataCallback<UITextView>? = nil,
        didEndEditing: DataCallback<UITextView>? = nil,
        shouldBeginEditing: ReturnedDataCallback<UITextView, Bool>? = nil,
        shouldEndEditing: ReturnedDataCallback<UITextView, Bool>? = nil,
        shouldChangeTextIn: ReturnedDataCallback<(UITextView, NSRange, String), Bool>?  = nil
    ) {
        self.init(frame: .zero, textContainer: nil)
        self.didTextChanged = didTextChanged
        self.didBeginEditing = didBeginEditing
        self.didEndEditing = didEndEditing
        self.shouldBeginEditing = shouldBeginEditing
        self.shouldEndEditing = shouldEndEditing
        self.shouldChangeTextIn = shouldChangeTextIn
        self.delegate = self
    }
}

// MARK: - UITextViewDelegate
extension AppTextView: UITextViewDelegate {
    
    public func textViewDidBeginEditing(_ textView: UITextView) {
        didBeginEditing?(textView)
    }
    
    public func textViewDidEndEditing(_ textView: UITextView) {
        didEndEditing?(textView)
    }
    
    public func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        return shouldBeginEditing?(textView) ?? true
    }
    
    public func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        return shouldEndEditing?(textView) ?? true
    }
    
    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newText = (textView.text as NSString?)?.replacingCharacters(in: range, with: text) ?? ""
        if let maxCharacters = maxCharacters {
            if maxCharacters > 0 && newText.count > maxCharacters {
                return false
            }
        }
        let shouldChangeText = shouldChangeTextIn?((self, range, text)) ?? true
        if shouldChangeText {
            didTextChanged?(newText)
        }
        return shouldChangeText
    }
}

#endif
