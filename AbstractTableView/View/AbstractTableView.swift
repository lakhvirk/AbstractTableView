//
//  AbstractTableView.swift
//  AbstractTableView
//
//  Created by Lakhwinder Singh on 2021-06-20.
//

import UIKit

public class AbstractTableView: UITableView {

    let tableCellID = "reuseIdentifier"
    public var tableDataSource = TableViewDataSource()

    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.setupTableView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupTableView()
    }
    
}

//MARK: - Set up Table view

extension AbstractTableView {
    func setupTableView() {
        dataSource = self
        delegate = self
        register(cellClass, forCellReuseIdentifier: tableCellID)
    }
}

//MARK: - Useful methods for child classes

extension AbstractTableView {
    open var cellClass: AnyClass {
        return UITableViewCell.self
    }

    public func getTableViewCell(_ indexPath: IndexPath) -> UITableViewCell {
        return dequeueReusableCell(withIdentifier: tableCellID, for: indexPath)
    }

    public func removeExtraLines() {
        tableFooterView = UIView()
    }
}

//MARK: - TableView data source methods

extension AbstractTableView: UITableViewDataSource {
    open func numberOfSections(in tableView: UITableView) -> Int {
        return tableDataSource.numberOfSections
    }

    open func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableDataSource.headerForSection(section)
    }

    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableDataSource.numberOfRowsInSection(section)
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = getTableViewCell(indexPath)
        cell.textLabel?.numberOfLines = 0
        
        if let rowTitle = tableDataSource.rowTitle(indexPath) {
            cell.textLabel?.text = rowTitle
        }
        return cell
    }
}

//MARK: - TableView delegate methods

extension AbstractTableView: UITableViewDelegate {
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: - TableView set data methods

extension AbstractTableView {
    public func setRows(_ rows: [Any]) {
        tableDataSource.rows = rows
        reloadData()
    }
    
    public func setSections(_ sections: [(header: Any, rows: [Any])]) {
        tableDataSource.sections = sections
        reloadData()
    }
}
