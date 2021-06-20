//
//  AbstractTableViewControllerTests.swift
//  AbstractTableViewTests
//
//  Created by Lakhwinder Singh on 2021-06-19.
//

import XCTest
@testable import AbstractTableView

class AbstractTableViewControllerTests: XCTestCase {

    var abstractTableViewController: AbstractTableViewController!
    var rowsMockData: [AnyHashable]?
    var sectionsMockData: [(header: AnyHashable, rows: [AnyHashable])]?

    override func setUp() {
        super.setUp()
        abstractTableViewController = AbstractTableViewController()
        abstractTableViewController.delegate = self
        abstractTableViewController.viewDidLoad()
        
        XCTAssertTrue(abstractTableViewController.isViewLoaded)
    }

    override func tearDown() {
        abstractTableViewController = nil
        super.tearDown()
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRowsRenderSuccessfully() throws {
        // Assert
        rowsMockData = ["Row 1", "Row 2", "Row 3"]
        XCTAssertEqual(abstractTableViewController.rows, rowsMockData, "Error in fetching rows from delegate")

        XCTAssertEqual(abstractTableViewController.rows?.count ?? 0, abstractTableViewController.tableView.dataSource?.tableView(abstractTableViewController.tableView, numberOfRowsInSection: 0), "Error in table view number of rows in section")
    }

    func testSectionsRenderSuccessfully() throws {
        // Assert
        sectionsMockData = [
            (header: "Header Title", rows: ["Row 1", "Row 2", "Row 3"]),
            (header: "Header Title2", rows: ["Row 2 1", "Row 2 2", "Row 2 3"])
        ]

        let sectionsEql = abstractTableViewController.sections?.count == sectionsMockData?.count

        XCTAssertTrue(sectionsEql, "Error in fetching sections from delegate")
        XCTAssertEqual(abstractTableViewController.sections?.count ?? 0, abstractTableViewController.tableView.dataSource?.numberOfSections?(in: abstractTableViewController.tableView), "Error in table view number of sections")
    }
}

extension AbstractTableViewControllerTests: TableViewDataProtocol {
    var rows: [AnyHashable]? {
        get {
            return rowsMockData
        }
    }
    var sections: [(header: AnyHashable, rows: [AnyHashable])]? {
        get {
            return sectionsMockData
        }
    }
}
