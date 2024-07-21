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
    @IBOutlet private weak var tableView: UITableView!
    
    private(set) lazy var placeholderView: PlaceholderView = {
        let view = PlaceholderView(
            type:  AppPlaceholder.emptyList,
            options: PlaceholderOptions(),
            didActionButtonTapped: {  [weak self] in
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
        view.isHidden = true
        return view
    }()
    
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
        
        
        self.view.addSubview(placeholderView)

        // Disable autoresizing mask constraints
        placeholderView.translatesAutoresizingMaskIntoConstraints = false

        // Activate constraints
        NSLayoutConstraint.activate([
            placeholderView.topAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.topAnchor),
            placeholderView.leadingAnchor.constraint(equalTo: tableView.leadingAnchor, constant: 0.0),
            placeholderView.trailingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: 0.0),
            placeholderView.bottomAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        let isVisible = true
        if isVisible {
            self.placeholderView.isHidden = false
            self.tableView.tableHeaderView?.isHidden = true
        } else {
            self.placeholderView.isHidden = true
            self.tableView.tableHeaderView?.isHidden = false
        }
    }
    
    override func setupView(with state: ViewState) {}
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension TableExampleViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        0 //models.count
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
