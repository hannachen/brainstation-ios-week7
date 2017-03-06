//
//  Location.swift
//  Week7 Homework
//
//  Created by Hanna Chen on 2/27/17.
//  Copyright © 2017 Rethink Canada. All rights reserved.
//

import Foundation
import UIKit

class Location {
    var name: String
    var image: UIImage
    var description: String
    var visited: Bool = false
    
    init(name: String, image: UIImage, description: String, visited: Bool = false) {
        self.name = name
        self.image = image
        self.description = description
        self.visited = visited
    }
}
