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

public protocol ButtonDecorate: Decorate {
    var buttonStyle: ButtonStyle? { get set }
}

public protocol LabelDecorate: Decorate {
    var labelStyle: LabelStyle? { get set }
}

public protocol ViewDecorate: Decorate {
    var viewStyle: ViewStyle? { get set }
}
