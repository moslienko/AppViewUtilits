//
//  AppViewModel.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 31.10.2020.
//  Copyright © 2021 moslienko. All rights reserved.
//

import Foundation
import UIKit

public protocol AppViewModelIdentifiable: AnyObject {
    var inset: UIEdgeInsets { get set }
}

open class AppViewModel: AppViewModelIdentifiable {
    
    // MARK: - Props
    open var inset: UIEdgeInsets = .zero
    
    // MARK: - Initialization
    public init() { }
    
}
