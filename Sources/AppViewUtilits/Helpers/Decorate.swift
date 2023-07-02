//
//  Decorate.swift
//  
//
//  Created by Pavel Moslienko on 14.11.2020.
//

import Foundation
#if canImport(UIKit)
import UIKit
#endif

public protocol Decorate {}

extension NSObject: Decorate { }

public extension Decorate {
    
    static func style(_ style: @escaping (Self) -> Void) -> (Self) -> Void {
        return style
    }
    
    func apply(_ style: DecorateWrapper<Self>) {
        switch style {
        case let .wrap(style):
            style(self)
        }
    }
    
    func apply(_ styles: [DecorateWrapper<Self>]) {
        styles.forEach({ self.apply($0) })
    }
}

public typealias Style<Element> = (Element) -> Void

public enum DecorateWrapper<Element> {
    case wrap(style: Style<Element>)
}
