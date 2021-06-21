//
//  ViewController.swift
//  AbstractTableViewExample
//
//  Created by Lakhwinder Singh on 2021-06-19.
//

import UIKit
import AbstractTableView

class ViewController: UIViewController {

    @IBOutlet weak var customTableView: AbstractTableView!
//    let tableView = AbstractTableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        customTableView.setRows(["Heyy", "This is working my friend."])
//        tableView.setRows(["Heyy", "This is working my friend.", nil])
//        view.addSubview(tableView)
        // Do any additional setup after loading the view.
    }

    @IBAction func openTablePressed(_ sender: Any) {
//        let tableView = TableViewController()
//        present(tableView, animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        tableView.fillToSuperView()
    }
}

