//
//  TableViewController.swift
//  AbstractTableViewExample
//
//  Created by Lakhwinder Singh on 2021-06-20.
//

import UIKit
import AbstractTableView

struct TestModel {
    var name = ""
    var description = ""
}

class TableViewController: AbstractTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let model1 = TestModel(name: "My Title", description: "My Description")
        let model2 = TestModel(name: "My Title2", description: "My Description2")
        let model3 = TestModel(name: "My Title3", description: "My Description3")
        let model4 = TestModel(name: "Test 1 askdha sdh ayisdfhaskd ahs syidhkasd iasukhd ajkhds asdkhf jahdksf sdhf dsfh dshjf dshfj dsjhf sdhfj sdfhj dsfhj43 fnds fhg34jrbefd mf3h4jg bdfnserfg2 43bend", description: "My Description3")
        setSections(
            [
                (header: "Section 1", rows: [model1, model2, model3, model4]),
                (header: "Section 2", rows: [model1, model2, model3]),
                (header: "Section 3", rows: [model1, model2, model3]),
            ]
        )
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = getTableViewCell(indexPath)
        if let testModel = tableDataSource.sections?[indexPath.section].rows[indexPath.row] as? TestModel {
            cell.textLabel?.text = testModel.name
        }
        return cell
    }

}
