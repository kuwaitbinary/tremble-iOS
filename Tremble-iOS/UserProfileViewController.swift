//
//  UserProfileViewController.swift
//  Tremble-iOS
//
//  Created by Omar Alobaid on 10/28/15.
//  Copyright © 2015 Techzone. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {

    @IBOutlet weak var idOutlet: UILabel!
    @IBOutlet weak var nameOutlet: UILabel!
    @IBOutlet weak var emailOutlet: UILabel!
    @IBOutlet weak var mobileOutlet: UILabel!
    @IBOutlet weak var subjectOutlet: UILabel!
    @IBOutlet weak var gradeOutlet: UILabel!
    
    override func viewDidAppear(animated: Bool) {
        
        let defaultData = NSUserDefaults.standardUserDefaults()
        
        let id = defaultData.objectForKey("SISID")?.description
        let name = defaultData.objectForKey("name")?.description
        let email = defaultData.objectForKey("email")?.description
        let mobie = defaultData.objectForKey("mobile")?.description
        let subject = defaultData.objectForKey("subject")?.description
        let grade = defaultData.objectForKey("grade")?.description
        
        idOutlet.text = "SISID:" + id!
        nameOutlet.text = "Name: " + name!
        emailOutlet.text = "Email: " + email!
        mobileOutlet.text = "Mobile: " + mobie!
        subjectOutlet.text = "Subject: " + subject!
        gradeOutlet.text = "Grade: " + grade!
        
    }

}