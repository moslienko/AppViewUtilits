//
//  Callback.swift
//  Example
//
//  Created by Pavel Moslienko on 12.06.2023.
//  Copyright © 2023 moslienko. All rights reserved.
//

import Foundation

public typealias Callback = () -> Void
public typealias DataCallback<T> = (T) -> Void
public typealias ValueCallback<T> = () -> T
public typealias ReturnedDataCallback<A, B> = (A) -> B
