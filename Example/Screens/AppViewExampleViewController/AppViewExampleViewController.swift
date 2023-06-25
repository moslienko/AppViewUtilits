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

    public class var fromXib: AppViewExampleViewController {
        AppViewExampleViewController(nibName: "AppViewExampleViewController", bundle: nil)
    }
    
    override func reloadData() {
        self.view.backgroundColor = .white
        self.navigationItem.title = "App View"

        let itemModel = ListItemViewModel(title: "Hello world!")
        itemModel.actionCallback = {
            itemModel.title = "\(Date().millisecondsSince1970)"
            self.listItemView.updateView()
        }
        self.listItemView.model = itemModel
        
        let tableLinkModel = ListItemViewModel(title: "Open table")
        tableLinkModel.actionCallback = {
            self.navigationController?.pushViewController(TableExampleViewController(), animated: true)
        }
        self.tableLinkListItemView.model = tableLinkModel
        
        Log.info("Hello")
    }
    
    override func setupView(with state: ViewState) {}
}
