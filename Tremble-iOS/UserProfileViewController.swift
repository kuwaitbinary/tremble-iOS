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
    
    @IBAction func logoutAction(sender: AnyObject) {
        
        let alert = UIAlertController(title: "Logout", message: "Are You Sure You Want to Logout?", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction (title: "Yes", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            
            let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            let ViewController = mainStoryboard.instantiateViewControllerWithIdentifier("LoginScreen") as UIViewController
            self.presentViewController(ViewController, animated: true, completion: nil)
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let defaultData = NSUserDefaults.standardUserDefaults()
        
        let id = defaultData.objectForKey("SISID")?.description
        let name = defaultData.objectForKey("name")?.description
        let email = defaultData.objectForKey("email")?.description
        let mobie = defaultData.objectForKey("mobile")?.description
        let subject = defaultData.objectForKey("subject")?.description
        let grade = defaultData.objectForKey("grade")?.description
        
        idOutlet.text = id!
        nameOutlet.text = name!
        emailOutlet.text = email!
        mobileOutlet.text = mobie!
        subjectOutlet.text = subject!
        gradeOutlet.text = grade!
        
    }

}