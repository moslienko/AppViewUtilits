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
    private lazy var listItemView: ListItemView = {
        let view = ListItemView()
        return view
    }()
    
    private lazy var tableLinkListItemView: ListItemView = {
        let view = ListItemView()
        return view
    }()
    
    private lazy var enableListItemView: ListItemView = {
        let view = ListItemView()
        return view
    }()
    
    private lazy var layoutTestingView: UIView = {
        let view = UIView(backgroundColor: .systemRed)
        return view
    }()
    
    var isEnabledBtns = true
    var isDarkTheme = false {
        didSet {
            AppThemeManager.default.setAppTheme()
            self.setupView()
        }
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
            
            let newTestableViewWidth: CGFloat = self.layoutTestingView.bounds.width == 64 ? 200 : 64
            self.layoutTestingView.layout.width(newTestableViewWidth)
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
        
        listItemView.layout
            .addToSuperview(self.view)
            .height(64.0)
            .top(to: self.view.safeAreaLayoutGuide.topAnchor)
            .leading(to: self.view.leadingAnchor)
            .trailing(to: self.view.trailingAnchor)
        
        enableListItemView.layout
            .addToSuperview(self.view)
            .height(64.0)
            .top(to: listItemView.bottomAnchor)
            .leading(to: self.view.leadingAnchor)
            .trailing(to: self.view.trailingAnchor)
        
        tableLinkListItemView.layout
            .addToSuperview(self.view)
            .height(64.0)
            .top(to: enableListItemView.bottomAnchor)
            .leading(to: self.view.leadingAnchor)
            .trailing(to: self.view.trailingAnchor)
        
        layoutTestingView.layout
            .addToSuperview(self.view)
            .width(64.0)
            .height(64.0)
            .bottom(to: self.view.safeAreaLayoutGuide.bottomAnchor)
            .leading(to: self.view.safeAreaLayoutGuide.leadingAnchor, offset: 8)
    }
    
    func testRecursion(){
        RecursionFunction(maxRetryCount: 5)
            .performRecursion(
                isCondition: {
                    Int.random(in: 0...5) == 3
                },
                didHandleMethod: {
                    Log.debug("Recursion success handler")
                },
                delay: 3.0
            )
    }
}
