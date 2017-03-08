//
//  Updatable.swift
//  Week7 Homework
//
//  Created by Hanna Chen on 3/6/17.
//  Copyright © 2017 Rethink Canada. All rights reserved.
//

import Foundation

protocol LocationTableViewCellDelegate {
    
    func cellButtonToggle(cell: LocationTableViewCell)
    
    func detailsButtonToggle(location: Location, index: Int)
}
