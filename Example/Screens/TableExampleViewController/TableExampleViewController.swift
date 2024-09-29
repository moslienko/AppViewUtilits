//
//  TableExampleViewController.swift
//  Example
//
//  Created by Pavel Moslienko on 12.06.2023.
//  Copyright © 2023 moslienko. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#endif
import AppViewUtilits

// MARK: - ViewController

enum AppPlaceholder: PlaceholderType {
    case emptyList
    
    var title: String {
        switch self {
        case .emptyList:
            return "Empty list"
        }
    }
   
    var message: String? {
        switch self {
        case .emptyList:
            return "You don't have any entries yet"
        }
    }
   
    var buttonTitle: String? {
        switch self {
        case .emptyList:
            return "Close"
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .emptyList:
            if #available(iOS 13.0, *) {
                return UIImage(systemName: "list.clipboard")
            } else {
                return nil
            }
        }
    }
}

/// The ViewController
class TableExampleViewController: AppViewController {
    
    // MARK: Properties
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        return view
    }()
    
    private(set) lazy var placeholderView: PlaceholderView = {
        let view = PlaceholderView(
            type:  AppPlaceholder.emptyList,
            options: PlaceholderOptions(),
            didActionButtonTapped: {  [weak self] in
                self?.tableView.removePlaceholder()
                self?.navigationController?.popViewController(animated: true)
            }
        )
        view.decorate(
            buttonRegularStyle: .wrap(style: { button in
                button.backgroundColor = .systemGreen
                button.tintColor = .white
                button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
                button.layer.cornerRadius = 15
            }),
            highlightedStyle: .wrap(style: { button in
                button.backgroundColor = .systemGreen.withAlphaComponent(0.7)
            })
        )
        return view
    }()
    
    private var models: [[AppViewCellIdentifiable]] = []
    
    override func reloadData() {
        self.view.backgroundColor = .systemGroupedBackground
        self.navigationItem.title = "Table"
                
        self.tableView.layout.addToSuperview(self.view)
        self.tableView.layout.edgesToSuperview()
        
        self.tableView.registerCellClass(ExampleCell.self)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .singleLine
        
        self.setupTableData()
        self.tableView.reloadData()
                
        self.setupComponnents()
    }
    
    func setupComponnents() {
        self.navigationItem.rightBarButtonItem = AppBarButtonItem(
            icon: self.models.isEmpty ? UIImage(systemName: "plus.app") : UIImage(systemName: "clear"),
            style: .done,
            action: {
                if self.models.isEmpty {
                    self.tableView.removePlaceholder()
                    self.setupTableData()
                    self.tableView.reloadData()
                } else {
                    self.models = []
                    self.tableView.reloadData()
                    self.tableView.addPlaceholder(self.placeholderView)
                }
                
                self.setupComponnents()
            }
        )
    }
    
    override func setupView(with state: ViewState) {}
    
    private func setupTableData() {
        var section: [AppViewCellIdentifiable] = []
        
        for i in 1...10 {
            let cellModel = ExampleCellModel(title: "Cell #\(i)")
            section += [cellModel]
        }
        self.models = [section]
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension TableExampleViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models[safe: section]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = models[safe: indexPath.section]?[safe: indexPath.row]else {
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(with: ExampleCell.self, for: indexPath)
        cell.cellModel = model as? ExampleCellModel
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44.0
    }
}
