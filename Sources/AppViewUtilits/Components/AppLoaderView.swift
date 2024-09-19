//
//  AppLoaderView.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 20.07.2024.
//  Copyright © 2024 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public class AppLoaderView: AppView {
    
    // MARK: - Properties
    private lazy var activityView = UIActivityIndicatorView()
    
    override public func setupComponents() {
        super.setupComponents()
        addActivityViewToSuperview()
    }
    
    // MARK: - Public methods
    public func configureActivityView(style: UIActivityIndicatorView.Style, color: UIColor, backgroundColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.activityView.style = style
        self.activityView.color = color
    }
    
    public func beginLoading() {
        self.activityView.startAnimating()
    }
    
    public func finishLoading() {
        self.activityView.stopAnimating()
    }
}

// MARK: - Setup
private extension AppLoaderView {
    
    func addActivityViewToSuperview() {
        self.activityView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(activityView)
        NSLayoutConstraint.activate([
            activityView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}

#endif
