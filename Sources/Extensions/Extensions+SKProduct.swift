//
//  Extensions+SKProduct.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 16.08.2021.
//  Copyright © 2022 moslienko. All rights reserved.
//

import Foundation
import StoreKit

public extension SKProduct {
    
    var formattedDefaultPrice: String {
        self.getFormattedPrice(from: self.price)
    }
    
    var formattedYearPriceOnSingleMonth: String {
        let price = Int(Float(truncating: self.price) / Float(12.0))
        return self.getFormattedPrice(from: NSDecimalNumber(value: price))
    }
    
    private func getFormattedPrice(from price: NSDecimalNumber) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = self.priceLocale
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        
        let numberFormatter = NumberFormatter()
        numberFormatter.formatterBehavior = .behavior10_4
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = self.priceLocale
        
        return formatter.string(from: price) ?? ""
    }
}
