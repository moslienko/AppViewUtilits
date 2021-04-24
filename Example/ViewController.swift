//
//  ViewController.swift
//  Example
//
//  Created by Pavel Moslienko on 24 апр. 2021 г..
//  Copyright © 2021 moslienko. All rights reserved.
//

import UIKit
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
    }
    
    override func setupView(with state: ViewState) {}
}
