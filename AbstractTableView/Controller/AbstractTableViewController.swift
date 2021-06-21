//
//  AbstractTableViewController.swift
//  AbstractTableView
//
//  Created by Lakhwinder Singh on 2021-06-19.
//

import UIKit

open class AbstractTableViewController: UITableViewController {

    let tableCellID = "reuseIdentifier"
    public var tableDataSource = TableViewDataSource()
  
    // MARK: init view
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    required public override init(style: UITableView.Style) {
        super.init(style: style)
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
}

//MARK: - Set up Table view

// Check if comment comes up
extension AbstractTableViewController {
    func setupTableView() {
        tableView.register(cellClass, forCellReuseIdentifier: tableCellID)
    }
}

//MARK: - Useful methods for child classes

extension AbstractTableViewController {
    open var cellClass: AnyClass {
        return UITableViewCell.self
    }

    public func getTableViewCell(_ indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: tableCellID, for: indexPath)
    }

    public func removeExtraLines() {
        tableView.tableFooterView = UIView()
    }
}

//MARK: - TableView data source methods

/*
 TableView data source methods
 */
extension AbstractTableViewController {
    open override func numberOfSections(in tableView: UITableView) -> Int {
        return tableDataSource.numberOfSections
    }

    open override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableDataSource.headerForSection(section)
    }

    open override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDataSource.numberOfRowsInSection(section)
    }
    
    open override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = getTableViewCell(indexPath)
        cell.textLabel?.numberOfLines = 0
        
        if let rowTitle = tableDataSource.rowTitle(indexPath) {
            cell.textLabel?.text = rowTitle
        }
        return cell
    }
}

//MARK: - TableView delegate methods

/*
 TableView delegate methods
 */
extension AbstractTableViewController {
    open override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: - TableView set data methods

extension AbstractTableViewController {
    public func setRows(_ rows: [Any]) {
        tableDataSource.rows = rows
        tableView.reloadData()
    }
    
    public func setSections(_ sections: [(header: Any, rows: [Any])]) {
        tableDataSource.sections = sections
        tableView.reloadData()
    }
}
