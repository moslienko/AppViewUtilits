//
//  Extension+UILabel.swift
//  
//
//  Created by Pavel Moslienko on 06.10.2020.
//

#if canImport(UIKit)
import UIKit
#endif

public extension UILabel {
    
    // MARK: - Lines
    
    var maxNumberOfLines: Int {
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(MAXFLOAT))
        let text = (self.text ?? "") as NSString
        let textHeight = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [.font: font ?? UIFont.systemFont(ofSize: 14.0)], context: nil).height
        let lineHeight = font.lineHeight
        return Int(ceil(textHeight / lineHeight))
    }
    
    var numberOfVisibleLines: Int {
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(MAXFLOAT))
        let textHeight = sizeThatFits(maxSize).height
        let lineHeight = font.lineHeight
        return Int(ceil(textHeight / lineHeight))
    }
    
    var isTruncated: Bool {
        guard let labelText = text else {
            return false
        }
        
        let labelTextSize = (labelText as NSString).boundingRect(
            with: CGSize(width: frame.size.width, height: .greatestFiniteMagnitude),
            options: .usesLineFragmentOrigin,
            attributes: [.font: font ?? UIFont.systemFont(ofSize: 14.0)],
            context: nil).size
        
        return labelTextSize.height > bounds.size.height
    }
    
    func countLabelLines() -> Int {
        guard let labelText = self.text as NSString? else {
            return 0
        }
        let rect = CGSize(width: self.bounds.width, height: CGFloat.greatestFiniteMagnitude)
        let labelSize = labelText.boundingRect(with: rect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: self.font ?? UIFont.systemFont(ofSize: 14.0)], context: nil)
        return Int(ceil(CGFloat(labelSize.height) / self.font.lineHeight))
    }
    
    func setLineHeight(_ lineHeight: CGFloat) {
        if let text = self.text {
            let attributeString = NSMutableAttributedString(string: text)
            let style = NSMutableParagraphStyle()
            
            style.lineSpacing = lineHeight
            style.alignment = self.textAlignment
            attributeString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: attributeString.length))
            self.attributedText = attributeString
        }
    }
}
