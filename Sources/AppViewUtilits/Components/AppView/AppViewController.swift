//
//  AppViewController.swift
//  Example
//
//  Created by Pavel Moslienko on 21.09.2020.
//  Copyright © 2021 moslienko. All rights reserved.
//

import Foundation
#if canImport(UIKit)
import UIKit
#endif

// View
public protocol ViewState {}
// Presenter
public protocol PresenterInputAction {}

public protocol ViewActionEvent: AppViewController {
    func setupView(with state: ViewState)
    func reloadData()
}

public class PresentActionEvent {
    func handleInputAction(_ action: PresenterInputAction) {}
}

// VC helper
open class AppViewController: UIViewController, ViewActionEvent {
    
    private var customPullRefreshHandler: Bool = false
    public var pullRefreshHandler: Callback?
    
    public func initAppViewController() {
        let tapGestureReconizer = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        tapGestureReconizer.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGestureReconizer)
    }
    
    public func addPullRefresh(to scrollView: UIScrollView, tintColor: UIColor, custoHandler: Bool = false) {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = tintColor
        refreshControl.addTarget(self, action: #selector(pullRefreshList(refreshControl:)), for: .valueChanged)
        scrollView.refreshControl = refreshControl
        
        self.customPullRefreshHandler = custoHandler
    }
    
    open func setupView(with state: ViewState) { }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.initAppViewController()
        self.reloadData()
    }
    
    open func reloadData() { }
    
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

public protocol ViewComponents {}
