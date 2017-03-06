//
//  ViewController.swift
//  Week7 Homework
//
//  Created by Hanna Chen on 2/27/17.
//  Copyright © 2017 Rethink Canada. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, Updatable {
    // Outlets
    @IBOutlet var locationTableView: UITableView!
    
    // Data
    let manager = LocationDataSource()
    
    // Properties
    var locations: [Location] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set title
        self.title = "Travel to these places!"
        
        // Assign "self" as the delegate, similar to the previous lesson
        self.locationTableView.delegate = self
        
        // Assigns "self" as the data source
        self.locationTableView.dataSource = self
        
        self.locations = manager.getLocations()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Num of cells to create
        return self.locations.count
    }
    
    // UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // tableView Cell is "Template"(?) of the cell
        // Dequeueing our cell
        let cell: LocationTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LocationTableViewCell // Using ! here is a rare exception...
        
        cell.updateDelegate = self
        cell.rowIndex = indexPath.row
        
        // Set cell data
        cell.setupCellWith(location: self.locations[indexPath.row])
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "detailview") {
            let cell = sender as? LocationTableViewCell
            let indexPath = self.locationTableView.indexPath(for: cell!)
            
            if let detailsViewController = segue.destination as? LocationDetailsViewController {
                if let location = self.locations[indexPath!.row] as Location? {
                    detailsViewController.location = location
                }
            
            }
        }
    }
    
    func update(location: Location, index: Int) {
        self.locations[index] = location
    }

}

