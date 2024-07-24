//
//  AppViewExampleViewController.swift
//  Example
//
//  Created by Pavel Moslienko on 24 апр. 2021 г..
//  Copyright © 2021 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#endif
import AppViewUtilits

// MARK: - ViewController

/// The ViewController
class AppViewExampleViewController: AppViewController {
    
    // MARK: Properties
    @IBOutlet private weak var listItemView: ListItemView!
    @IBOutlet private weak var tableLinkListItemView: ListItemView!
    @IBOutlet private weak var enableListItemView: ListItemView!
    
    var isEnabledBtns = true
    var isDarkTheme = false {
        didSet {
            print("setAppTheme - \(isDarkTheme)")
            AppThemeManager.default.setAppTheme()
            self.setupView()
        }
    }
    
    public class var fromXib: AppViewExampleViewController {
        AppViewExampleViewController(nibName: "AppViewExampleViewController", bundle: nil)
    }
    
    override func reloadData() {
        self.view.backgroundColor = .systemGroupedBackground
        self.navigationItem.title = "App View"
        self.setupView()

        AppThemeManager.default.setOverrideUserInterfaceStyleCallback = {
            self.isDarkTheme ? .dark : .light
        }
        
        let itemModel = ListItemViewModel(title: "Hello world!", isEnabled: isEnabledBtns)
        itemModel.actionCallback = {
            itemModel.title = "\(Date().millisecondsSince1970)"
            self.listItemView.updateView()
        }
        self.listItemView.model = itemModel
        
        let tableLinkModel = ListItemViewModel(title: "Open table", isEnabled: isEnabledBtns)
        tableLinkModel.actionCallback = {
            self.navigationController?.pushViewController(TableExampleViewController(), animated: true)
        }
        self.tableLinkListItemView.model = tableLinkModel
        
        let setEnableModel = ListItemViewModel(title: "Toggle btns enable status", isEnabled: true)
        setEnableModel.actionCallback = {
            self.isEnabledBtns.toggle()
            itemModel.isEnabled = self.isEnabledBtns
            self.listItemView.updateView()
            tableLinkModel.isEnabled = self.isEnabledBtns
            self.tableLinkListItemView.updateView()
        }
        self.enableListItemView.model = setEnableModel
        
        Log.info("Hello")
    }
    
    override func setupView(with state: ViewState) {}
    
    func setupView() {
        self.navigationItem.rightBarButtonItem = AppBarButtonItem(
            icon: self.isDarkTheme ? UIImage(systemName: "sun.max") : UIImage(systemName: "moon"),
            style: .done,
            action: {
                self.isDarkTheme.toggle()
            }
        )
    }
    
    func testRecursion(){
        RecursionFunction(maxRetryCount: 5)
            .performRecursion(
                isCondition: {
                    Int.random(in: 0...5) == 3
                },
                didHandleMethod: {
                    print("Recursion success handler")
                },
                delay: 3.0
            )
    }
}
