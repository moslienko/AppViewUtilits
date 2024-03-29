//
//  ContentSizedTableView.swift
//  
//
//  Created by Pavel Moslienko on 24.04.2020.
//

#if canImport(UIKit)
import UIKit
#endif

internal final class ContentSizedTableView: UITableView {
    
    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
    
}
