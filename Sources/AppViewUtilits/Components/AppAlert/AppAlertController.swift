//
//  AppAlertController.swift
//  AppViewUtilits-iOS
//
//  Created by Pavel Moslienko on 23.07.2024.
//  Copyright © 2024 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit

/// A custom `UIAlertController` subclass for presenting alerts.
public class AppAlertController: UIAlertController {
        
    /// Flag whether the alert is now shown on the screen
    private var isAlertCurrentlyPresented = false
    
    /// Presents alert.
    /// - Parameter model: The model used to configure the alert.
    public static func presentAlert(using model: AppAlertViewModel) {
        guard let topController = UIApplication.getTopViewController() else {
            return
        }
        
        let alertController = createAppAlertController(with: model)
        
        onMainThread {
            topController.present(alertController, animated: true, completion: nil)
        }
    }
    
    /// Creates an `AppAlertController`.
    /// - Parameter model: The model used to configure the alert.
    /// - Returns: A configured `AppAlertController`.
    public static func createAppAlertController(with model: AppAlertViewModel) -> AppAlertController {
        let alertController = AppAlertController(
            title: model.title,
            message: model.message,
            preferredStyle: model.preferredStyle
        )
        alertController.configureAlert(with: model)
                
        return alertController
    }
}

// MARK: - Private methods
private extension AppAlertController {
    
    /// Configures the alert.
    /// - Parameter model: The model used to configure the alert.
    func configureAlert(with model: AppAlertViewModel) {
        if model.preventMultipleAlerts {
            if isAlertCurrentlyPresented {
                return
            }
        }
        isAlertCurrentlyPresented = true
        
        if let configureTextField = model.configureTextField {
            self.addTextField { textField in
                configureTextField(textField)
            }
        }
        
        model.actions?.forEach { action in
            let alertAction = UIAlertAction(title: action.title,
                                            style: action.style) { _ in
                self.isAlertCurrentlyPresented = false
                action.action?()
            }
            self.addAction(alertAction)
        }
        
        self.view.tintColor = model.tintColor
    }
}

#endif
