//
//  Extension+UITextField.swift
//  
//
//  Created by Pavel Moslienko on 04.12.2019.
//

#if canImport(UIKit)
import UIKit

public extension UITextField {
    
    func fixCaretPosition() {
        // Moving the caret to the correct position by removing the trailing whitespace
        // http://stackoverflow.com/questions/14220187/uitextfield-has-trailing-whitespace-after-securetextentry-toggle
        let beginning = beginningOfDocument
        selectedTextRange = textRange(from: beginning, to: beginning)
        let end = endOfDocument
        selectedTextRange = textRange(from: end, to: end)
    }
    
    func setPlaceholderTextColor(_ color: UIColor) {
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder != nil ? self.placeholder! : "", attributes: [.foregroundColor: color])
    }
    
    func isAvailableInput(limit: Int, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.isEmpty {
            return true
        }
        if let text = self.text, (text.count + string.count - range.length) <= limit {
            return true
        } else {
            return false
        }
    }
}

#endif
