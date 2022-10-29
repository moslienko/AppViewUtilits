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

public protocol Decorate { }

extension NSObject: Decorate { }

public extension Decorate {
    
    static func style(style: @escaping Style<Self>) -> Style<Self> { return style }
    
    func decorate(_ style: DecorateWrapper<Self>) {
        switch style {
        case let .wrap(style):
            style(self)
        }
    }
    
    func decorate(_ styles: [DecorateWrapper<Self>]) {
        styles.forEach({ self.decorate($0) })
    }
}

public typealias Style<Element> = (Element) -> Void

public enum DecorateWrapper<Element> {
    case wrap(style: Style<Element>)
}
