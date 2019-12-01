//
//  ViewController.swift
//  SimpleTableView
//
//  Created by Neal on 2019/11/25.
//  Copyright © 2019 neal812220. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        tableView.rowHeight = 100
        if let label = cell.viewWithTag(1) as? UILabel {
            label.text = "This is section 0, row\(indexPath.row)"
        }
        return cell
    }


}

