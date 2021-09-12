//
//  Extension+UIStackView.swift
//  
//
//  Created by Pavel Moslienko on 28.10.2019.
//

#if canImport(UIKit)
import UIKit
#endif

public extension UIStackView {
    
    func addArrangedSubviewList(_ list: [UIView]) {
        list.forEach({ self.addArrangedSubview($0) })
    }
    
    func removeAllArrangedSubviews(){
        self.arrangedSubviews.forEach({ $0.removeFromSuperview() })
    }
    
    func addBackground(color: UIColor) {
        let subview = UIView(frame: bounds)
        subview.backgroundColor = color
        subview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subview, at: 0)
    }
}
