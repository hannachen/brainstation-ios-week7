//
//  VisitUIButton.swift
//  Week7 Homework
//
//  Created by Hanna Chen on 3/7/17.
//  Copyright © 2017 Rethink Canada. All rights reserved.
//

import UIKit

class VisitUIButton: UIButton {
    // Properties
    let defaultButtonTextColor: UIColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
    let defaultButtonBackgroundColor: UIColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    let highlightButtonTextColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    let highlightButtonBackgroundColor: UIColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
    let visitedText: String = "Visited"
    let markVisitedText: String = "Mark as Visited"
    
    func updateButton(visited: Bool) {
        
        // Setup styles based on `visited`
        let checkButtonTextColor: UIColor = visited ? self.highlightButtonTextColor : self.defaultButtonTextColor
        let checkButtonBackgroundColor: UIColor = visited ? self.highlightButtonBackgroundColor : self.defaultButtonBackgroundColor
        
        // Apply styles
        self.backgroundColor = checkButtonBackgroundColor
        self.setTitleColor(checkButtonTextColor, for: .normal)
        
        // Set text label
        self.setTitle(visited ? self.visitedText : self.markVisitedText, for: .normal)
    }

}
