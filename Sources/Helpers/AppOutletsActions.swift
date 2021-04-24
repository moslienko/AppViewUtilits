//
//  AppOutletsActions.swift
//  
//
//  Created by Pavel Moslienko on 29.11.2020.
//

import UIKit

@objc
fileprivate class ClosureSleeve: NSObject {
    let closure: ()->()
    
    init (_ closure: @escaping ()->()) {
        self.closure = closure
    }
    
    @objc func invoke () {
        closure()
    }
}

public extension UIControl {
    
    func addAction(for controlEvents: UIControl.Event = .touchUpInside, _ closure: @escaping ()->()) {
        let sleeve = ClosureSleeve(closure)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
        objc_setAssociatedObject(self, "[\(arc4random())]", sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
    
    func tapEnd(_ closure: @escaping ()->()) {
        let actions: [UIControl.Event] = [.touchUpInside, .touchUpOutside, .touchCancel]
        actions.forEach({ action in
            self.addAction(for: action) {
                closure()
            }
        })
    }
    
    func tapBegin(_ closure: @escaping ()->()) {
        self.addAction(for: .touchDown) {
            closure()
        }
    }
}

public extension UIView {
    func addAction(_ closure: @escaping ()->()) {
        let sleeve = ClosureSleeve(closure)
        
        let tap = UITapGestureRecognizer(target: sleeve, action: #selector(ClosureSleeve.invoke))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tap)
        
        objc_setAssociatedObject(self, "[\(arc4random())]", sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}
