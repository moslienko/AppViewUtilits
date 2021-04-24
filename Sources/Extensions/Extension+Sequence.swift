//
//  Extension+Sequence.swift
//  
//
//  Created by Pavel Moslienko on 04.05.2019.
//

import Foundation

public extension Sequence {
    
    /**
    Группировка структуры, массива, класса
    */
    func group<GroupingType: Hashable>(by key: (Iterator.Element) -> GroupingType) -> [[Iterator.Element]] {
        var groups: [GroupingType: [Iterator.Element]] = [:]
        var groupsOrder: [GroupingType] = []
        forEach { element in
            let key = key(element)
            if case nil = groups[key]?.append(element) {
                groups[key] = [element]
                groupsOrder.append(key)
            }
        }
        return groupsOrder.map { groups[$0]! }
    }
    
}
