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
    @IBOutlet var descriptionTextView: UITextView!
    
    // Properties
    var location: Location?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let location = self.location {
            self.locationImageView.image = location.image
            self.descriptionTextView.text = location.description
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
