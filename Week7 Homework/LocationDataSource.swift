//
//  LocationDataSource.swift
//  Week7 Homework
//
//  Created by Hanna Chen on 3/6/17.
//  Copyright © 2017 Rethink Canada. All rights reserved.
//

import Foundation
import UIKit

class LocationDataSource {
    var locations: [Location] = []
    
    init(name: String) {
        guard let asset = NSDataAsset(name: name),
              let data = asset.data as Data?,
              let json = try? JSONSerialization.jsonObject(with: data, options: []) as! NSArray else {
            return
        }
        for field in json as [AnyObject] {
            
            // Check for value and cast
            guard let name = field["name"] as? String,
                  let imageName = field["image"] as? String,
                  let image = UIImage(named: imageName),
                  let description = field["description"] as? String else {
                return
            }
            self.locations.append(Location(name: name, image: image, description: description))
        }
    }
    
    func getLocations()->[Location] {
        return self.locations
    }
}
