//
//  ViewController.swift
//  Example
//
//  Created by Lakhwinder Singh on 2021-06-24.
//

import UIKit
import AbstractTableView

class ViewController: UIViewController {

    @IBOutlet weak var tableView: AbstractTableView!
    
    let talbeData: [(header: String, rows: [String])] = [
        (header: "Simple Table views", rows: [
            "Table View with Abstraction", "Table View Controller with Abstraction",
            "Add table View Programatically", "Add table View Controller Programatically",
        ]),
        (header: "Customised Table views", rows: [
            "Table View with Abstraction", "Table View Controller with Abstraction",
            "Add table View Programatically", "Add table View Controller Programatically",
        ])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
    }


}

// MARK: - Initialise view controller

extension ViewController {
    func loadItems() {
        tableView.setSections(talbeData)
    }
}
