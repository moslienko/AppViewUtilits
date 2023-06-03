//
//  Extension+Int.swift
//  
//
//  Created by Pavel Moslienko on 18.03.2020.
//

#if canImport(UIKit)
import UIKit
#endif

public extension Int {
    
    func getDate() -> Date {
        return Date(timeIntervalSince1970: TimeInterval(self) / 1000)
    }
    
    var degreesToRadians: CGFloat {
        return CGFloat(self) * .pi / 180.0
    }
    
}
