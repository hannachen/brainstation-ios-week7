//
//  LocationTableViewCell.swift
//  Week7 Homework
//
//  Created by Hanna Chen on 2/27/17.
//  Copyright © 2017 Rethink Canada. All rights reserved.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

    // Outlets
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var locationImageView: UIImageView!
    @IBOutlet var checkButton: UIButton!
    
    // Properties
    
    // Other
    var defaultButtonTextColor: UIColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
    var defaultButtonBackgroundColor: UIColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        // Prevent background colours from clearing on cell select
        self.selectionStyle = UITableViewCellSelectionStyle.none
    }
    
    // On check button click
    @IBAction func checkButton(_ sender: UIButton) {
        // Update button status (checkButton)
        self.checkButton.backgroundColor = UIColor.red
//        self.checkButton.setImage(UIImage(named: "play.png"), for: UIControlState.normal)
    }
    
    func setupCellWith(location: Location) {
        // Populate labels with data
        self.locationLabel.text = location.name
        self.locationImageView.image = location.image
        
        // Set button style
        let checkButtonTextColor: UIColor = location.visited ? UIColor.green : self.defaultButtonTextColor
        let checkButtonBackgroundColor: UIColor = location.visited ? UIColor.white : self.defaultButtonBackgroundColor
        self.checkButton.setTitleColor(checkButtonTextColor, for: UIControlState.normal)
        self.checkButton.backgroundColor = checkButtonBackgroundColor
    }
    
}
