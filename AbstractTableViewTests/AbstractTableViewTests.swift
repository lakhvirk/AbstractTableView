//
//  AbstractTableViewTests.swift
//  AbstractTableViewTests
//
//  Created by Lakhwinder Singh on 2021-06-20.
//

import XCTest
@testable import AbstractTableView

class AbstractTableViewTests: XCTestCase {

    var abstractTableView: AbstractTableView!

    override func setUp() {
        super.setUp()
        abstractTableView = AbstractTableView()
        abstractTableView.removeExtraLines()
        abstractTableView.tableView(abstractTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
    }

    override func tearDown() {
        abstractTableView = nil
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
        _ = AbstractTableView(coder: coder)
    }

    func testFillToSuperview() throws {
        let parentView = UIView()
        parentView.addSubview(abstractTableView)
        abstractTableView.fillToSuperView()
    }

    func testRowsRenderSuccessfully() throws {
        // Assert
        let rowsMockData = ["Row 1", "Row 2", "Row 3"]
        abstractTableView.setRows(rowsMockData)
        let tableDataSource = abstractTableView.tableDataSource

        let rowsEqual = tableDataSource.rows as! [String] == rowsMockData
        XCTAssertTrue(rowsEqual, "Error in fetching rows from delegate")

        XCTAssertEqual(tableDataSource.rows?.count ?? 0, abstractTableView.dataSource?.tableView(abstractTableView, numberOfRowsInSection: 0), "Error in table view number of rows in section")
        
        let cell = abstractTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertEqual(cell?.textLabel?.text, "Row 1", "Text label is not being rendered properly")
    }

    func testSectionsRenderSuccessfully() throws {
        // Assert
        let sectionsMockData = [
            (header: "Header Title", rows: ["My Row 1", "My Row 2", "My Row 3"]),
            (header: "Header Title2", rows: ["My Row 2 1", "My Row 2 2", "My Row 2 3"])
        ]
        abstractTableView.setSections(sectionsMockData)
        let tableDataSource = abstractTableView.tableDataSource

        let sectionsEql = tableDataSource.sections?.count == sectionsMockData.count

        XCTAssertTrue(sectionsEql, "Error in fetching sections from delegate")
        XCTAssertEqual(tableDataSource.sections?.count ?? 0, abstractTableView.dataSource?.numberOfSections?(in: abstractTableView), "Error in table view number of sections")
    }
}
