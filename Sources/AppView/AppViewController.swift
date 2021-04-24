//
//  AppViewController.swift
//  Example
//
//  Created by Pavel Moslienko on 21.09.2020.
//  Copyright © 2021 moslienko. All rights reserved.
//

import Foundation
import UIKit

// View
protocol ViewState {}
// Presenter
protocol PresenterInputAction {}

class ViewActionEvent: UIViewController {
    func setupView(with state: ViewState) {}
    func reloadData() {}
}

class PresentActionEvent {
    func handleInputAction(_ action: PresenterInputAction) {}
}

// VC helper
class AppViewController: ViewActionEvent {
    
    private var customPullRefreshHandler: Bool = false
    var pullRefreshHandler: (() -> Void)?
    
    func initAppViewController() {
        let tapGestureReconizer = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        tapGestureReconizer.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGestureReconizer)
    }
    
    func addPullRefresh(to scrollView: UIScrollView, tintColor: UIColor, custoHandler: Bool = false) {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = tintColor
        refreshControl.addTarget(self, action: #selector(pullRefreshList(refreshControl:)), for: .valueChanged)
        scrollView.refreshControl = refreshControl
        
        self.customPullRefreshHandler = custoHandler
    }
    
    override func reloadData() {}
    
    @objc
    private func tap(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @objc
    private func pullRefreshList(refreshControl: UIRefreshControl) {
        refreshControl.endRefreshing()
        if self.customPullRefreshHandler {
            self.pullRefreshHandler?()
        } else {
            self.reloadData()
        }
    }
}

protocol ViewComponents {}
