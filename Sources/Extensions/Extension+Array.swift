//
//  Extension+Array.swift
//  
//
//  Created by Pavel Moslienko on 20.10.2020.
//

public extension Array {
    
    subscript(index: Int, default defaultValue: @autoclosure () -> Element) -> Element {
        guard index >= 0, index < endIndex else {
            return defaultValue()
        }
        
        return self[index]
    }
    
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
    
    func rearrange(fromIndex: Int, toIndex: Int) -> [Element] {
        guard self.indices.contains(fromIndex), self.indices.contains(toIndex) else {
            return self
        }
        var arr = self
        let element = arr.remove(at: fromIndex)
        arr.insert(element, at: toIndex)
        
        return arr
    }
    
    func uniqueValues <V:Equatable> (value: (Element) -> V) -> [Element] {
        var result: [Element] = []
        for element in self {
            if !result.contains(where: { value($0) == value(element) }) {
                result.append(element)
            }
        }
        return result
    }
    
}
