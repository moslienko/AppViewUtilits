//
//  AppScrollView.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 20.07.2024.
//  Copyright © 2024 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public class AppScrollView: UIScrollView {
    
    // MARK: - Init
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupScrollView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupScrollView()
    }
    
    public override func touchesShouldCancel(in view: UIView) -> Bool {
        if view.isKind(of: UIButton.self) {
            return true
        }
        
        return super.touchesShouldCancel(in: view)
    }
}

// MARK: - Public methods
public extension AppScrollView {
    
    func scrollToTop(animated: Bool) {
        let topOffset = CGPoint(x: 0, y: -contentInset.top)
        self.setContentOffset(topOffset, animated: animated)
    }
    
    func scrollToBottom(animated: Bool) {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height + contentInset.bottom)
        self.setContentOffset(bottomOffset, animated: animated)
    }
    
    func scrollToLeft(animated: Bool) {
        let leftOffset = CGPoint(x: -contentInset.left, y: 0)
        self.setContentOffset(leftOffset, animated: animated)
    }
    
    func scrollToRight(animated: Bool) {
        let rightOffset = CGPoint(x: contentSize.width - bounds.size.width + contentInset.right, y: 0)
        self.setContentOffset(rightOffset, animated: animated)
    }
    
    func setScrollIndicatorsVisibility(vertical: Bool, horizontal: Bool) {
        self.showsVerticalScrollIndicator = vertical
        self.showsHorizontalScrollIndicator = horizontal
    }
}

// MARK: - Setup
private extension AppScrollView {
    
    func setupScrollView() {
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

#endif
