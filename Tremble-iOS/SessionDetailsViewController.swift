//
//  SessionDetailsViewController.swift
//  Tremble-iOS
//
//  Created by Omar Alobaid on 11/1/15.
//  Copyright © 2015 Techzone. All rights reserved.
//

import UIKit

class SessionDetailsViewController: UIViewController {
    
    var session = SessionDetails()

    @IBOutlet weak var classNameOutlet: UILabel!
    @IBOutlet weak var courseNameOutlet: UILabel!
    @IBOutlet weak var locationNameOutlet: UILabel!
    @IBOutlet weak var zoneNameOutlet: UILabel!
    @IBOutlet weak var trainerNameOutlet: UILabel!
    @IBOutlet weak var waveDateOutlet: UILabel!
    @IBOutlet weak var evalutionOutlet: UIButton!
    
    override func viewDidAppear(animated: Bool) {
        
        let defaultData = NSUserDefaults.standardUserDefaults()
        let evaluationFlag = defaultData.objectForKey("evaluationFlag")?.description
        
        if evaluationFlag == "true" {
            
            evalutionOutlet.hidden = true
            
        }
        
        classNameOutlet.text = session.className
        courseNameOutlet.text = session.courseName
        locationNameOutlet.text = session.locationName
        zoneNameOutlet.text = session.zoneName
        trainerNameOutlet.text = session.trainerName
        
        var dates:[String] = session.waveDate.characters.split { $0 == "," }.map(String.init)
        var dateText = ""
        
        for(var i = 0; i < dates.count; i++) {
            dateText += dates[i]
            
            if i != dates.count - 1 {
                dateText += "\n"
            }
        }
        
        waveDateOutlet.text = dateText
        
    }
    
}