//
//  Extension+Dictionary.swift
//  
//
//  Created by Pavel Moslienko on 22.02.2019.
//

import Foundation

public extension Dictionary {
    
    /**
     Добавление новых записей в словарь
     */
    mutating func update(other: Dictionary) {
        for (key,value) in other {
            self.updateValue(value, forKey:key)
        }
    }
    
}
