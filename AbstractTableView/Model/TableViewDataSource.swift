//
//  TableViewDataSource.swift
//  AbstractTableView
//
//  Created by Lakhwinder Singh on 2021-06-20.
//

import Foundation

public class TableViewDataSource {
    public var rows: [Any]?
    public var sections: [(header: Any, rows: [Any])]?

    
    public var numberOfSections: Int {
        return sections?.count ?? 1
    }

    public func headerForSection(_ section: Int) -> String? {
        if let safeSections = sections {
            if safeSections.count > section {
                if let header = safeSections[section].header as? String {
                    return header
                }
            }
        }
        return nil
    }

    public func numberOfRowsInSection(_ section: Int) -> Int {
        if let safeSections = sections  {
            if safeSections.count > section {
                return safeSections[section].rows.count
            }
        }
        return rows?.count ?? 0
    }

    public func rowTitle(_ indexPath: IndexPath) -> String? {
        if let safeSections = sections  {
            if let rows = safeSections[indexPath.section].rows as? [String] {
                return rows[indexPath.row]
            }
        } else {
            if let row = rows?[indexPath.row] as? String {
                return row
            }
        }
        
//        // Throw an error to let user know about to use tableview incase array does not contain string.
//        NSException(name: NSExceptionName(rawValue: "Failed to render text in table cell"), reason: "Custom array of objects not supported in AbstractTableView. Please use `override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell` in your own class", userInfo: nil).raise()
        return nil
    }

}
