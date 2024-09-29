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

/// A protocol for providing a common interface for styling objects.
public protocol Decorate {}

extension NSObject: Decorate {}

/// Add styling functionality to conforming types.
public extension Decorate {
    
    /// Creates a style for the conforming type.
    static func style(_ style: @escaping (Self) -> Void) -> (Self) -> Void {
        return style
    }
    
    /// Applies a single style to the conforming object.
    func apply(_ style: DecorateWrapper<Self>) {
        switch style {
        case let .wrap(style):
            style(self)
        }
    }
    
    /// Applies multiple styles to the conforming object.
    func apply(_ styles: [DecorateWrapper<Self>]) {
        styles.forEach({ self.apply($0) })
    }
}

/// A typealias for a styling closure.
public typealias Style<Element> = (Element) -> Void

/// Wrapping a style closure.
public enum DecorateWrapper<Element> {
    case wrap(style: Style<Element>)
}
