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
    
    // MARK: - Placeholder
    public var placeholder: String? {
        didSet {
            placeholderLabel.text = placeholder
            updatePlaceholderVisibility()
        }
    }
    
    public var placeholderColor: UIColor = .lightGray {
        didSet {
            placeholderLabel.textColor = placeholderColor
        }
    }
    
    public var placeholderFont: UIFont? {
        didSet {
            placeholderLabel.font = placeholderFont ?? self.font
        }
    }
    
    public var placeholderFrame: CGRect?
    
    private lazy var placeholderLabel: UILabel = {
        let label = UILabel()
        label.textColor = placeholderColor
        label.font = placeholderFont ?? self.font
        label.numberOfLines = 0
        label.backgroundColor = .clear
        addSubview(label)
        
        return label
    }()
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.commonInit()
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
        
        self.commonInit()
    }
    
    public override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        layoutPlaceholder()
    }
    
    private func commonInit() {
        self.delegate = self
        configurePlaceholder()
    }
}

// MARK: - Placeholder methods
private extension AppTextView {
    
    // MARK: - Placeholder Configuration
    func configurePlaceholder() {
        placeholderLabel.text = placeholder
        placeholderLabel.textColor = placeholderColor
        placeholderLabel.font = placeholderFont ?? self.font
        updatePlaceholderVisibility()
    }
    
    func layoutPlaceholder() {
        placeholderLabel.frame = placeholderFrame ?? CGRect(x: 5, y: 5, width: bounds.width - 10, height: 0)
        placeholderLabel.sizeToFit()
    }
    
    func updatePlaceholderVisibility() {
        placeholderLabel.isHidden = !text.isEmpty
    }
}

// MARK: - UITextViewDelegate
extension AppTextView: UITextViewDelegate {
    
    public func textViewDidBeginEditing(_ textView: UITextView) {
        didBeginEditing?(textView)
    }
    
    public func textViewDidEndEditing(_ textView: UITextView) {
        didEndEditing?(textView)
        updatePlaceholderVisibility()
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
            updatePlaceholderVisibility()
        }
        return shouldChangeText
    }
    
    public func textViewDidChange(_ textView: UITextView) {
        updatePlaceholderVisibility()
    }
}

#endif
