//
//  Extension+UIScrollView.swift
//  Example
//
//  Created by Pavel Moslienko on 31.10.2020.
//  Copyright © 2021 moslienko. All rights reserved.
//

import AppViewUtilits
#if canImport(UIKit)
import UIKit
#endif

public extension UIScrollView {
    
    func scrollToBottom(_ animated: Bool) {
        if self.contentSize.height < self.bounds.size.height { return }
        let bottomOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height)
        self.setContentOffset(bottomOffset, animated: animated)
    }
    
    // Display placeholder
    func addPlaceholder(_ view: PlaceholderView) {
        removePlaceholder()
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            view.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])

        self.layoutIfNeeded()
    }
    
    // Remove placeholder
    func removePlaceholder() {
        self.subviews.first(where: { $0 is PlaceholderView })?.removeFromSuperview()
    }
}

