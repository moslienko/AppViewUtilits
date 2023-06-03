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
    
    static func stackView(_ arrangedSubviews: [UIView],
                          axis: NSLayoutConstraint.Axis,
                          alignment: Alignment,
                          distribution: Distribution,
                          spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        stackView.axis = axis
        stackView.alignment = alignment
        stackView.distribution = distribution
        stackView.spacing = spacing
        return stackView
    }
    
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
