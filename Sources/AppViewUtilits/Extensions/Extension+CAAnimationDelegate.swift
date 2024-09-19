//
//  Extension+CAAnimationDelegate.swift
//  
//
//  Created by Pavel Moslienko on 20.04.2019.
//

#if canImport(UIKit)
import UIKit

fileprivate enum SlideAnimation {
    case left, right
    
    func animation() -> CATransition {
        let animation = CATransition()
        animation.type = CATransitionType.push
        
        switch self {
        case .left:
            animation.subtype = CATransitionSubtype.fromLeft
        case .right:
            animation.subtype = CATransitionSubtype.fromRight
        }
        
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.fillMode = CAMediaTimingFillMode.removed
        
        return animation
    }
}

// Анимация переключения
public protocol CAAnimationDelegate {}

extension UIView: CAAnimationDelegate {
    
    private func animationKey() -> String {
        return "slideInFromLeftTransition"
    }
    
    func slideInFromLeft(duration: TimeInterval = 1.0, completionDelegate: () -> Void) {
        let animation = SlideAnimation.right.animation()
        self.layer.add(animation, forKey: self.animationKey())
        
        completionDelegate()
    }
    
    func slideInFromRight(duration: TimeInterval = 1.0, completionDelegate: () -> Void) {
        let animation = SlideAnimation.left.animation()
        self.layer.add(animation, forKey: self.animationKey())
        
        completionDelegate()
    }
}

#endif
