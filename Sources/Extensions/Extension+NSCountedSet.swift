//
//  Extension+NSCountedSet.swift
//  
//
//  Created by Pavel Moslienko on 27.10.2019.
//

import Foundation

public extension NSCountedSet {
    
    var occurences: [(object: Any, count: Int)] {
        return allObjects.map { ($0, count(for: $0))}
    }
    
    var dictionary: [AnyHashable: Int] {
        return allObjects.reduce(into: [AnyHashable: Int](), {
            guard let key = $1 as? AnyHashable else { return }
            $0[key] = count(for: key)
        })
    }
    
}
