//
//  Extension+UIImageView.swift
//  Example
//
//  Created by Pavel Moslienko on 24.04.2021.
//  Copyright © 2021 moslienko. All rights reserved.
//

import AppViewUtilits
import Foundation
#if canImport(UIKit)
import UIKit

public extension UIImageView {
    func imageFromURL(url: URL?, placeholder: UIImage? = nil) {
        guard let url = url else {
            self.image = placeholder
            return
        }
        var indicatorStyle: UIActivityIndicatorView.Style {
            if #available(iOS 13.0, *) {
                return .medium
            } else {
                return .gray
            }
        }
        let activityIndicator = UIActivityIndicatorView(style: indicatorStyle)
        activityIndicator.frame = CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        activityIndicator.startAnimating()
        if self.image == nil{
            self.addSubview(activityIndicator)
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                Log.error(error ?? "Unknown Error")
                DispatchQueue.main.async {
                    activityIndicator.removeFromSuperview()
                    self.image = placeholder
                }
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                activityIndicator.removeFromSuperview()
                self.image = image
            })
            
        }).resume()
    }
    
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}

#endif
