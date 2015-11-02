//
//  SessionDetailsViewController.swift
//  Tremble-iOS
//
//  Created by Omar Alobaid on 11/1/15.
//  Copyright © 2015 Techzone. All rights reserved.
//

import UIKit

class SessionDetailsViewController: UIViewController {
    
    var session = ActiveSession()

    @IBOutlet weak var classNameOutlet: UILabel!
    @IBOutlet weak var courseNameOutlet: UILabel!
    @IBOutlet weak var locationNameOutlet: UILabel!
    @IBOutlet weak var locationGpsOutlet: UILabel!
    @IBOutlet weak var zoneNameOutlet: UILabel!
    @IBOutlet weak var trainerNameOutlet: UILabel!
    @IBOutlet weak var waveDateOutlet: UILabel!
    
    override func viewDidAppear(animated: Bool) {
        
        classNameOutlet.text = session.className
        courseNameOutlet.text = session.courseName
        locationNameOutlet.text = session.locationName
        locationGpsOutlet.text = session.locationGPS
        zoneNameOutlet.text = session.zoneName
        trainerNameOutlet.text = session.trainerName
        waveDateOutlet.text = session.waveDate
        
    }

}