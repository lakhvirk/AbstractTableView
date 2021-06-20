//
//  AbstractTableViewController.swift
//  AbstractTableView
//
//  Created by Lakhwinder Singh on 2021-06-19.
//

import UIKit

public class AbstractTableViewController: UITableViewController {

    public var delegate: TableViewDataProtocol?

    var rows: [AnyHashable]? {
        return delegate?.rows
    }

    var sections: [(header: AnyHashable, rows: [AnyHashable])]? {
        return delegate?.sections
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    public override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections?.count ?? 0
    }

    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ((sections != nil) ? sections?[section].rows.count : rows?.count) ?? 0
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        if sections != nil {
            if let rows = sections?[indexPath.section].rows as? [String] {
                cell.textLabel?.text = rows[indexPath.row] as String
            }
        } else {
            if let rows = rows?[indexPath.row] as? [String] {
                cell.textLabel?.text = rows[indexPath.row] as String
            }
        }

        return cell
    }
}

//MARK: - Set up Table view

extension AbstractTableViewController {
    func setupTableView() {
        // Register cell classes
        tableView?.backgroundColor = UIColor.clear
//        tableView.estimatedRowHeight = cellClass.cellHeight
//        tableView?.rowHeight = UITableView.automaticDimension
//        tableView.separatorStyle = .none
//        tableView.separatorInset = .zero
//        tableView.tableFooterView = UIView()
//        if isNibUsed {
//            tableView!.register(
//                (UINib.init(
//                    nibName: String(describing: cellClass),
//                    bundle: nil)
//                ),
//                forCellReuseIdentifier: reuseId
//            )
//        } else {
//            tableView!.register(
//                self.cellClass,
//                forCellReuseIdentifier: self.reuseId
//            )
//        }
//        tableView!.showsVerticalScrollIndicator = false
//        tableView!.alwaysBounceVertical = true
//        let refreshControl = UIRefreshControl()
//        refreshControl.addTarget(
//            self,
//            action: #selector(AbstractTableListControl.refresh),
//            for: .valueChanged
//        )
//        if #available(iOS 10.0, *) {
//            tableView.refreshControl = refreshControl
//        } else {
//            tableView.backgroundView = refreshControl
//        }
//        var inset = UIEdgeInsets.zero
//        inset.bottom = bottomLayoutGuide.length
//        tableView.contentInset = inset
//        tableView?.backgroundView = self.customBackgroundView
    }
}
