//
//  Extension+UIViewController.swift
//  
//
//  Created by Pavel Moslienko on 20.08.2019.
//

import UIKit

public extension UIViewController {
    
    func deallocVC() {
        if let navVC = self as? UINavigationController {
            navVC.viewControllers.forEach { $0.dismiss(animated: false) }
            navVC.removeFromParent()
        }
        self.dismiss(animated: false) {
            self.view.removeFromSuperview()
            self.removeFromParent()
        }
    }
    
    /// Calculate top distance with "navigationBar" and "statusBar" by adding a
    /// subview constraint to navigationBar or to topAnchor or superview
    /// - Returns: The real distance between topViewController and Bottom navigationBar
    func calculateTopDistance() -> CGFloat{
        let misureView: UIView = UIView()
        misureView.backgroundColor = .clear
        view.addSubview(misureView)
        
        misureView.translatesAutoresizingMaskIntoConstraints = false
        misureView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        misureView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        misureView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        if let nav = navigationController {
            misureView.topAnchor.constraint(equalTo: nav.navigationBar.bottomAnchor).isActive = true
        } else {
            misureView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        }
        
        view.layoutIfNeeded()
        
        let distance = view.frame.size.height - misureView.frame.size.height
        misureView.removeFromSuperview()
        
        return distance
    }
    
    func reloadViewFromNib() {
        let parent = view.superview
        view.removeFromSuperview()
        view = nil
        parent?.addSubview(view)
    }
    
    func setBackNavigationItem(icon: UIImage) {
        let imageView = UIImageView(image: icon)
        let item = UIBarButtonItem(customView: imageView)
        item.action = #selector(backItemAction)
        self.navigationItem.leftBarButtonItem = item
    }
    
    @objc
    private func backItemAction() {
        self.dismiss(animated: true, completion: nil)
    }
}
