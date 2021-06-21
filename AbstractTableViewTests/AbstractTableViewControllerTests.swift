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

    override func setUp() {
        super.setUp()
        abstractTableViewController = AbstractTableViewController(style: .plain)
        abstractTableViewController.viewDidLoad()
        abstractTableViewController.removeExtraLines()
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

    func testInitWithCoder() {
        let coder = NSKeyedUnarchiver(forReadingWith: NSMutableData() as Data)
        _ = AbstractTableViewController(coder: coder)
    }

    func testRowsRenderSuccessfully() throws {
        // Assert
        let rowsMockData = ["Row 1", "Row 2", "Row 3"]
        abstractTableViewController.setRows(rowsMockData)
        let tableDataSource = abstractTableViewController.tableDataSource

        let rowsEqual = tableDataSource.rows as! [String] == rowsMockData
        XCTAssertTrue(rowsEqual, "Error in fetching rows from delegate")

        XCTAssertEqual(tableDataSource.rows?.count ?? 0, abstractTableViewController.tableView.dataSource?.tableView(abstractTableViewController.tableView, numberOfRowsInSection: 0), "Error in table view number of rows in section")
        
        let cell = abstractTableViewController.tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertEqual(cell?.textLabel?.text, "Row 1", "Text label is not being rendered properly")
    }

    func testSectionsRenderSuccessfully() throws {
        // Assert
        let sectionsMockData = [
            (header: "Header Title", rows: ["My Row 1", "My Row 2", "My Row 3"]),
            (header: "Header Title2", rows: ["My Row 2 1", "My Row 2 2", "My Row 2 3"])
        ]
        abstractTableViewController.setSections(sectionsMockData)
        let tableDataSource = abstractTableViewController.tableDataSource

        let sectionsEql = tableDataSource.sections?.count == sectionsMockData.count

        XCTAssertTrue(sectionsEql, "Error in fetching sections from delegate")
        XCTAssertEqual(tableDataSource.sections?.count ?? 1, abstractTableViewController.tableView.dataSource?.numberOfSections?(in: abstractTableViewController.tableView), "Error in table view number of sections")
        
        XCTAssertEqual(tableDataSource.sections?[0].rows.count ?? 0, abstractTableViewController.tableView.dataSource?.tableView(abstractTableViewController.tableView, numberOfRowsInSection: 0), "Error in table view number of sections")
    }
}
