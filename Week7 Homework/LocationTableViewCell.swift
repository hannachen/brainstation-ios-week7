//
//  LocationTableViewCell.swift
//  Week7 Homework
//
//  Created by Hanna Chen on 2/27/17.
//  Copyright © 2017 Rethink Canada. All rights reserved.
//

import UIKit

class LocationTableViewCell: UITableViewCell, UITableViewDelegate {

    // Outlets
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var locationImageView: UIImageView!
    @IBOutlet var checkButton: VisitUIButton!
    
    // Properties
    var delegate: LocationTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Prevent background colours from clearing on cell select
        self.selectionStyle = UITableViewCellSelectionStyle.none
    }
    
    // On check button click
    @IBAction func checkButtonClick(_ sender: UIButton) {
        
        // Delegate click back to the controller
        // REMEMBER -- Don't mutate data in view!! This file is a VIEW!
        if let delegate = self.delegate {
            
            delegate.cellButtonToggle(cell: self)
        }
    }
    
    func setupCellWith(location: Location) {
            
        // Populate UI with data
        self.locationLabel.text = location.name
        self.locationImageView.image = location.image
        
        // Update button style
        self.checkButton.updateButton(visited: location.visited)
    }
    
}
