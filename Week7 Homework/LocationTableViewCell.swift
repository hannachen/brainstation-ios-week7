//
//  LocationTableViewCell.swift
//  Week7 Homework
//
//  Created by Hanna Chen on 2/27/17.
//  Copyright © 2017 Rethink Canada. All rights reserved.
//

import UIKit

class LocationTableViewCell: UITableViewCell, UITableViewDelegate {
    
    // Constants
    let defaultButtonTextColor: UIColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
    let defaultButtonBackgroundColor: UIColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    let highlightButtonTextColor: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    let highlightButtonBackgroundColor: UIColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
    let visitedText: String = "Visited"
    let markVisitedText: String = "Mark as Visited"

    // Outlets
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var locationImageView: UIImageView!
    @IBOutlet var checkButton: UIButton!
    
    // Properties
    var rowIndex: Int?
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
            
            delegate.cellToggleButton(cell: self)
        }
    }
    
    func setupCellWith(location: Location) {
            
        // Populate labels with data
        self.locationLabel.text = location.name
        self.locationImageView.image = location.image
        
        // Update button style
        self.updateButton(visited: location.visited)
    }
    
    func updateButton(visited: Bool) {
    
        // Set button state
        let checkButtonTextColor: UIColor = visited ? self.highlightButtonTextColor : self.defaultButtonTextColor
        let checkButtonBackgroundColor: UIColor = visited ? self.highlightButtonBackgroundColor : self.defaultButtonBackgroundColor
    
        // Set styles
        self.checkButton.backgroundColor = checkButtonBackgroundColor
        self.checkButton.setTitleColor(checkButtonTextColor, for: .normal)
        
        // Set text label
        self.checkButton.setTitle(visited ? self.visitedText : self.markVisitedText, for: .normal)
    }
    
}