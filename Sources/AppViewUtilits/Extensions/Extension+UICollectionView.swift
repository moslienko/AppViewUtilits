//
//  Extension+UICollectionView.swift
//  Example
//
//  Created by Pavel Moslienko on 24.04.2021.
//  Copyright © 2021 moslienko. All rights reserved.
//

import Foundation
#if canImport(UIKit)
import UIKit

public extension UICollectionView {
    
    func register<T: UICollectionViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        let className = cellType.className
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: className)
    }
    
    func register<T: UICollectionViewCell>(cellTypes: [T.Type], bundle: Bundle? = nil) {
        cellTypes.forEach { register(cellType: $0, bundle: bundle) }
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as! T
    }
    
    func dequeue<T: UICollectionReusableView>(cell: T.Type, indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withReuseIdentifier: T.className, for: indexPath) as? T
    }
    
    func dequeue<T: UICollectionReusableView>(footer: T.Type, indexPath: IndexPath) -> T? {
        return  dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: T.className,
            for: indexPath) as? T
    }
    
    func registerSectionHeader<T: UICollectionReusableView>(_ header: T.Type) {
        register(header, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                 withReuseIdentifier: header.className)
    }
    
    func registerSectionFooter<T: UICollectionReusableView>(_ footer: T.Type) {
        register(footer, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                 withReuseIdentifier: footer.className)
    }
}

#endif
