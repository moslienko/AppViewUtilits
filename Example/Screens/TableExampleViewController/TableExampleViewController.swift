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

/// The ViewController
class TableExampleViewController: AppViewController {
    
    // MARK: Properties
    @IBOutlet private weak var tableView: UITableView!
    
    private var models: [[AppViewCellIdentifiable]] = []
    
    public class var fromXib: TableExampleViewController {
        TableExampleViewController(nibName: "TableExampleViewController", bundle: nil)
    }
    
    override func reloadData() {
        self.view.backgroundColor = .white
        self.navigationItem.title = "Table"
        
        self.tableView.registerCellClass(ExampleCell.self)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .singleLine
        
        var section: [AppViewCellIdentifiable] = []
        
        for i in 1...10 {
            let cellModel = ExampleCellModel(title: "Cell #\(i)")
            section += [cellModel]
        }
        self.models = [section]
        self.tableView.reloadData()
    }
    
    override func setupView(with state: ViewState) {}
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
