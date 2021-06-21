//
//  TableViewDataProtocolTests.swift
//  AbstractTableViewTests
//
//  Created by Lakhwinder Singh on 2021-06-20.
//

import XCTest
@testable import AbstractTableView

/*
 Tests for added extension to TableViewDataProtocol which should be nil by default
 */
class TableViewDataSourceTests: XCTestCase {

    var tableDataSource: TableViewDataSource?


    override func setUp() {
        tableDataSource = TableViewDataSource()
    }

    override func tearDown() {
        tableDataSource = nil
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDataSourceWithSections() throws {
        let sectionsMockData = [
            (header: "Header Title", rows: ["My Row 1", "My Row 2", "My Row 3"]),
            (header: "Header Title2", rows: ["My Row 2 1", "My Row 2 2", "My Row 2 3", "My Row 2 4"]),
            (header: "Header Title3", rows: ["My Row 3 1", "My Row 3 2", "My Row 3 3"])
        ]
        tableDataSource?.sections = sectionsMockData
        XCTAssertEqual(tableDataSource?.rowTitle(IndexPath(row: 0, section: 0)), "My Row 1", "TableViewDataSource rowTitle is not returning string properly")
        
        XCTAssertEqual(tableDataSource?.numberOfSections, 3, "TableViewDataSource numberOfSections is not returning count properly")
        
        XCTAssertEqual(tableDataSource?.numberOfRowsInSection(1), 4, "TableViewDataSource numberOfRowsInSection is not returning count properly")
        
        XCTAssertEqual(tableDataSource?.headerForSection(2), "Header Title3", "TableViewDataSource headerForSection is not returning header string properly")
    }

    func testDataSourceWithRows() throws {
        let rowsMockData = ["My Row 2 1", "My Row 2 2", "My Row 2 3", "My Row 2 4"]
        tableDataSource?.rows = rowsMockData
        
        XCTAssertEqual(tableDataSource?.numberOfRowsInSection(0), 4, "TableViewDataSource numberOfRowsInSection is not returning count properly")
    }

    func testDataSourceWithNonStringValues() throws {
        struct Person {
            var name: String = ""
            var city: String = ""
        }
        let person1 = Person(name: "Andre", city: "South Africa")
        let person2 = Person(name: "Jass", city: "Mexico")
        let person3 = Person(name: "Lakh", city: "Canada")

        let sectionsMockData = [
            (header: person1, rows: [person1, person2, person3]),
            (header: person2, rows: [person3, person1, person2])
        ]
        tableDataSource?.sections = sectionsMockData

        XCTAssertEqual(tableDataSource?.headerForSection(0), nil, "TableViewDataSource headerForSection is not returning nil properly")
    }

    // When both rows and sections are nil
    func testDataSourceWithNilCase() throws {
        XCTAssertEqual(tableDataSource?.numberOfSections, 1, "TableViewDataSource numberOfSections is not returning count properly")

        XCTAssertEqual(tableDataSource?.rowTitle(IndexPath(row: 0, section: 0)), nil, "TableViewDataSource rowTitle is not returning nil properly")
        
        XCTAssertEqual(tableDataSource?.numberOfRowsInSection(0), 0, "TableViewDataSource numberOfRowsInSection is not returning nil properly")
    }
}
