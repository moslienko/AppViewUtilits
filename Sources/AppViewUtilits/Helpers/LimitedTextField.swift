//
//  File.swift
//  
//
//  Created by Pavel Moslienko on 17.06.2019.
//

#if canImport(UIKit)
import UIKit
#endif
import Foundation

internal class LimitedTextField: UITextField {
    
    @IBInspectable var maxCharacters: Int = 1024
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.delegate = self
    }
}

// MARK: - UITextFieldDelegate
extension LimitedTextField: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
        return maxCharacters <= 0 ? true : newText.count <= maxCharacters
    }
}
