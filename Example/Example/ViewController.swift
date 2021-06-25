//
//  ViewController.swift
//  Example
//
//  Created by Lakhwinder Singh on 2021-06-24.
//

import UIKit
import AbstractTableView

/*
 In this root controller we are using AbstractTableView as a class of tableView we added in storyboard.
 We will be using datasource methods from AbstractTableView as we have simple strings.
 But we will be using delegate of tableview in this class to handle click.
 */
class ViewController: UIViewController {

    @IBOutlet weak var tableView: AbstractTableView!
    var selectedTitle: String?
    
    let talbeData: [(header: String, rows: [String])] = [
        (header: "Simple Table views", rows: [
            "Table View with Abstraction", "Table View Controller with Abstraction",
            "Add table View Programatically", "Add table View Controller Programatically",
        ]),
        (header: "Customised Table views", rows: [
            "Table View with Abstraction", "Table View Controller with Abstraction",
            "Add table View Programatically", "Add table View Controller Programatically",
        ]),
        (header: "Storyboard Table views", rows: [
            "Table View with StoryBoard", "Table View Controller with StoryBoard",
        ])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
    }


}

// MARK: - Initialise view controller

extension ViewController {
    func initTableView() {
        tableView.setSections(talbeData)
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        var routeName: String?
        
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            routeName = K.RouteNames.tableViewAbstraction
        case (0, 1):
            routeName = K.RouteNames.tableViewControllerAbstraction
        case (0, 2):
            routeName = K.RouteNames.tableViewProgramatically
        case (0, 3):
            routeName = K.RouteNames.tableViewControllerProgramatically
        case (1, 0):
            routeName = K.RouteNames.tableViewAbstractionCustom
        case (1, 1):
            routeName = K.RouteNames.tableViewControllerAbstractionCustom
        case (1, 2):
            routeName = K.RouteNames.tableViewProgramaticallyCustom
        case (1, 3):
            routeName = K.RouteNames.tableViewControllerProgramaticallyCustom
        case (2, 0):
            routeName = K.RouteNames.tableViewStoryBoard
        case (2, 1):
            routeName = K.RouteNames.tableViewControllerStoryBoard
        default:
            print("Should not reach here")
            break
        }
        selectedTitle = talbeData[indexPath.section].rows[indexPath.row]
        if let safeRoute = routeName {
            performSegue(withIdentifier: safeRoute, sender: nil)
        }
    }
}

extension ViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let title = selectedTitle {
            segue.destination.title = title
        }
    }
}
