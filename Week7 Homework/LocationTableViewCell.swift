//
//  LocationTableViewCell.swift
//  Week7 Homework
//
//  Created by Hanna Chen on 2/27/17.
//  Copyright © 2017 Rethink Canada. All rights reserved.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var durationTextField: UITextField!
    @IBOutlet var checkButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // On check button click
    @IBAction func checkButton(_ sender: UIButton) {
        // Update button status (checkButton)
//        self.checkButton.backgroundColor = UIColor.red
        self.checkButton.setImage(UIImage(named: "play.png"), for: UIControlState.normal)
    }
    
    func setupCellWith(location: Location) {
        self.locationLabel.text = location.name
        self.durationTextField.text = "\(location.duration) days"
    }
    
}
