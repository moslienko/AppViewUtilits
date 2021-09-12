//
//  AppView.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 31.10.2020.
//  Copyright © 2021 moslienko. All rights reserved.
//

import Foundation
#if canImport(UIKit)
import UIKit
#endif

public protocol AppViewDelegate {
    var model: AppViewModel? { get set }
    
    func updateView()
    
    func setupComponents()
    func setupActions()
    func applyStyles()
}

open class AppView: UIView, AppViewDelegate {
    public var model: AppViewModel? {
        didSet {
            self.updateView()
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setupActions()
        self.setupComponents()
        self.applyStyles()
    }
    
    open override func awakeAfter(using aDecoder: NSCoder) -> Any? {
        return self.loadFromNibIfEmbeddedInDifferentNib()
    }
    
    //    func setup(_ model: AppViewModel?) {
    //        self.model = model
    //    }
    
    open func updateView() {}
    open func setupComponents() {}
    open func setupActions() {}
    open func applyStyles() {}
    
}
