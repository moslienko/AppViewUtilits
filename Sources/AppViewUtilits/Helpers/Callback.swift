//
//  Callback.swift
//  Example
//
//  Created by Pavel Moslienko on 12.06.2023.
//  Copyright © 2023 moslienko. All rights reserved.
//

import Foundation
#if canImport(UIKit)
import UIKit
#endif

public typealias DataCallback<T> = (T) -> Void
public typealias Callback = () -> Void

