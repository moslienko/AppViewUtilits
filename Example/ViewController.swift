//
//  ViewController.swift
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
class ViewController: AppViewController {
    
    // MARK: Properties
    @IBOutlet private weak var listItemView: ListItemView!
    
    public class var fromXib: ViewController {
        ViewController(nibName: "ViewController", bundle: nil)
    }
    
    override func reloadData() {
        self.view.backgroundColor = .white
        
        let model = ListItemViewModel(title: "Hello world!")
        model.actionCallback = {
            model.title = "\(Date().millisecondsSince1970)"
            self.listItemView.updateView()
        }
        self.listItemView.model = model
        
        Log.info("Hello")
    }
    
    override func setupView(with state: ViewState) {}
}
