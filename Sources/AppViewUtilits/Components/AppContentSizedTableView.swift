//
//  AppContentSizedTableView.swift
//
//
//  Created by Pavel Moslienko on 24.04.2020.
//

#if canImport(UIKit)
import UIKit

/// A `UITableView` subclass that automatically adjusts its intrinsic content size based on its content size.
public final class AppContentSizedTableView: UITableView {

    override public var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override public var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}

#endif
