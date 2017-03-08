//
//  ViewController.swift
//  Week7 Homework
//
//  Created by Hanna Chen on 2/27/17.
//  Copyright © 2017 Rethink Canada. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, LocationTableViewCellDelegate {
    // Outlets
    @IBOutlet var locationTableView: UITableView!
    
    // Data
    let manager: LocationDataSource = LocationDataSource(name: "LocationJSON")
    
    // Properties
    var locations: [Location] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set title
        self.title = "Travel to these places!"
        
        // Read data from JSON file and set as locations
        self.locations = manager.getLocations()
        
        // Assigns "self" as the data source
        self.locationTableView.dataSource = self
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
        
        cell.delegate = self
        
        // Set cell data
        cell.setupCellWith(location: self.locations[indexPath.row])
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier != "detailview") {
            return
        }
        guard let detailsViewController = segue.destination as? LocationDetailsViewController,
              let indexPath = self.locationTableView.indexPathForSelectedRow,
              let location = self.locations[indexPath.row] as Location? else {
            return
        }
        detailsViewController.delegate = self
        detailsViewController.location = location
        detailsViewController.index = indexPath.row
    }
    
    func cellButtonToggle(cell: LocationTableViewCell) {
        
        guard let indexPath = self.locationTableView.indexPath(for: cell) else {
            return
        }
        
        let location = self.locations[indexPath.row]
        location.visited = !(location.visited) // Toggle visit state
        
        self.locationTableView.reloadData()
    }
    
    func detailsButtonToggle(location: Location, index: Int) {
        
        self.locations[index] = location
        self.locationTableView.reloadData()
    }
}

