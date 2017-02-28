//
//  ViewController.swift
//  Week7 Homework
//
//  Created by Hanna Chen on 2/27/17.
//  Copyright © 2017 Rethink Canada. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    // Outlets
    @IBOutlet var locationTableView: UITableView!
    
    // Properties
    
    // Data
    let locations: [Location] = [
        Location(name: "Niagra Falls", duration: 1),
        Location(name: "Chicago", duration: 2),
        Location(name: "France", duration: 0),
        Location(name: "New York", duration: 4),
        Location(name: "Tokyo", duration: 12),
        Location(name: "Iceland", duration: 0),
        Location(name: "Australia", duration: 0),
        Location(name: "Germany", duration: 0),
        Location(name: "Peru", duration: 10),
        Location(name: "China", duration: 0),
        Location(name: "Thailand", duration: 0),
        Location(name: "Los Angelos", duration: 4),
        Location(name: "New Zealand", duration: 0),
        Location(name: "Vanocuver", duration: 7)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Assigns "self" as the delegate, similar to the previous lesson
        self.locationTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // tableView Cell is "Template"(?) of the cell
        // Dequeueing our cell
        let cell: LocationTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LocationTableViewCell // Using ! here is a rare exception...
        
        // Set text on cell
        cell.setupCellWith(location: self.locations[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.locations.count
    }

}

