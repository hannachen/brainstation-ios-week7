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
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var locationDetailsScrollView: UIScrollView!
    @IBOutlet var locationVisitedLabel: UIView!
    
    // Properties
    var location: Location?
    var paragraphStyle = NSMutableParagraphStyle()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.paragraphStyle.lineSpacing = 4
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // onLoad Animation
        UIView.animate(withDuration: 0.25, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.descriptionLabel.alpha = 1
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let location = self.location else {
            return
        }
        
        self.title = "About \(location.name)"
        self.locationNameLabel.text = location.name
        self.locationImageView.image = location.image
        self.locationVisitedLabel.isHidden = location.visited ? false : true
        
        // Typesetting
        let attributes = [NSParagraphStyleAttributeName: self.paragraphStyle]
        self.descriptionLabel.attributedText = NSAttributedString(string: location.description, attributes: attributes)
    }

}
