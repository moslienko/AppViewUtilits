//
//  Extension+CGFloat.swift
//  
//
//  Created by Pavel Moslienko on 20.08.2019.
//

import UIKit

public extension CGFloat {
    
    var angle: CGFloat {
        let radians = self / 180.0 * CGFloat.pi
        return radians
    }
    
}

