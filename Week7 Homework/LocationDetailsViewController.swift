//
//  LocationDetailsViewController.swift
//  Week7 Homework
//
//  Created by Hanna Chen on 3/6/17.
//  Copyright © 2017 Rethink Canada. All rights reserved.
//

import UIKit

class LocationDetailsViewController: UIViewController {
    
    // Outlets
    @IBOutlet var locationImageView: UIImageView!
    @IBOutlet var locationNameLabel: UILabel!
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var locationDetailsScrollView: UIScrollView!
    @IBOutlet var locationVisitedLabel: UIView!
    
    // Properties
    var location: Location?
    
    var paragraphStyle = NSMutableParagraphStyle()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Typesetting paragraph styles
        self.paragraphStyle.lineSpacing = 5
        let attributes = [NSParagraphStyleAttributeName : self.paragraphStyle]
        self.descriptionTextView.attributedText = NSAttributedString(string: self.descriptionTextView.text, attributes:attributes)
        if let fontStyle =  self.descriptionTextView.font as UIFont? {
            self.descriptionTextView.font = UIFont(name: fontStyle.fontName, size: 14)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // onLoad Animation
        UIView.animate(withDuration: 0.25, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.descriptionTextView.alpha = 1
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        // Disable text view scroll so that scroll view is activated
        self.descriptionTextView.isScrollEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let location = self.location {
            self.title = "About \(location.name)"
            self.locationNameLabel.text = location.name
            self.locationImageView.image = location.image
            self.descriptionTextView.text = location.description
            self.locationVisitedLabel.isHidden = location.visited ? false : true
        }
    }

}
