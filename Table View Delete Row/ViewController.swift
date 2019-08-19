//
//  ViewController.swift
//  Table View Delete Row
//
//  Created by Mirko Cukich on 8/18/19.
//  Copyright © 2019 Digital Mirko. All rights reserved.
//
//  Swift UITableView Delete Row Demo - Demo 11 of 30

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    // Data Set
    var data = ["Bread", "Milk", "Cheese", "Mayo", "MayoMustard", "Coffee", "Green Tea",
                "Pizzelle", "Nutella", "Cottage Cheese", "Sour Cream"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    // Delete row option by click or swipe
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    // Table View Details: Number of Rows Count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    // Table View Details: Cell identifier
    func  tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = data[indexPath.row]
        return cell!
    }
}
