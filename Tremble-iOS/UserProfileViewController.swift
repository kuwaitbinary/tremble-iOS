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
        
        idOutlet.text = id
        
        let manager = ConnectionManager()
        
        manager.getUserProfile { (trainee) -> () in
            
            self.nameOutlet.text = trainee.firstname + " " + trainee.lastname
            self.emailOutlet.text = trainee.emial
            self.mobileOutlet.text = trainee.mobile
            self.subjectOutlet.text = trainee.subject
            self.gradeOutlet.text = trainee.grade
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
