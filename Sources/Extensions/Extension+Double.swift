//
//  Extension+Double.swift
//  
//
//  Created by Pavel Moslienko on 21.05.2020.
//

import Foundation

public extension Double {
    
    func asString(style: DateComponentsFormatter.UnitsStyle) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second, .nanosecond]
        formatter.unitsStyle = style
        guard let formattedString = formatter.string(from: self) else { return "" }
        
        return formattedString
    }
    
    func cleanStrIfNeeded() -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        
        formatter.numberStyle = .decimal
        
        return formatter.string(from: self as NSNumber) ?? String(self)
    }
    
    func truncate(places: Int) -> Double {
        Double(floor(pow(10.0, Double(places)) * self) / pow(10.0, Double(places)))
    }
    
    var clean: String {
        self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
