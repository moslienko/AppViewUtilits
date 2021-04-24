//
//  Extension+Collection.swift
//  
//
//  Created by Pavel Moslienko on 28.11.2020.
//

import Foundation

public extension Collection {
    
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
}
