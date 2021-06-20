//
//  TableViewDataProtocol.swift
//  AbstractTableView
//
//  Created by Lakhwinder Singh on 2021-06-19.
//

import Foundation

public protocol TableViewDataProtocol {
    var rows: [AnyHashable]? { get }
    var sections: [(header: AnyHashable, rows: [AnyHashable])]? { get }
}

private extension TableViewDataProtocol {
    var rows: [AnyHashable]? { get { return nil } }
    var sections: [(header: AnyHashable, rows: [AnyHashable])]? { get { return nil } }
}
