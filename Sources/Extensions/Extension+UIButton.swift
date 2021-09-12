//
//  Extension+UIButton.swift
//  Example
//
//  Created by Pavel Moslienko on 12.09.2021.
//  Copyright © 2021 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#endif

public extension UIButton {
    
    func setInsets(forContentPadding contentPadding: UIEdgeInsets, imageTitlePadding: CGFloat) {
        self.contentEdgeInsets = UIEdgeInsets(
            top: contentPadding.top,
            left: contentPadding.left,
            bottom: contentPadding.bottom,
            right: contentPadding.right + imageTitlePadding
        )
        self.titleEdgeInsets = UIEdgeInsets(
            top: 0,
            left: imageTitlePadding,
            bottom: 0,
            right: -imageTitlePadding
        )
    }
    
}
