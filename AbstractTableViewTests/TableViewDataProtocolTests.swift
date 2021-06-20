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
class TableViewDataProtocolTests: XCTestCase {

    class testTableViewDataProtocol : UIViewController, TableViewDataProtocol {
        var rows: [AnyHashable]? { get { return nil } }
        var sections: [(header: AnyHashable, rows: [AnyHashable])]? { get { return nil } }
    }

    var tableViewDataProtocol: TableViewDataProtocol?


    override func setUp() {
        tableViewDataProtocol = testTableViewDataProtocol()
    }

    override func tearDown() {
        tableViewDataProtocol = nil
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetters() throws {
        // Assert
        XCTAssertTrue(tableViewDataProtocol?.rows == nil)
        XCTAssertTrue(tableViewDataProtocol?.sections == nil)
    }

}
