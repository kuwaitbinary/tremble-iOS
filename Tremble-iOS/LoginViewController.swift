//
//  LoginViewController.swift
//  Tremble-iOS
//
//  Created by Omar Alobaid on 10/28/15.
//  Copyright © 2015 Techzone. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var idOutlet: UITextField!
    @IBOutlet weak var passwordOutlet: UITextField!
    
    @IBAction func loginAction(sender: AnyObject) {
        
        let manager = ConnectionManager()
        
        manager.login(idOutlet.text!, password: passwordOutlet.text!) { (validData) -> () in
            
            if validData {
                
                let defaultData = NSUserDefaults.standardUserDefaults()
                defaultData.setValue(self.idOutlet.text, forKey: "SISID")
                defaultData.setValue(self.passwordOutlet.text, forKey: "password")
                
                let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
                let ViewController = mainStoryboard.instantiateViewControllerWithIdentifier("UserProfile") as UIViewController
                self.presentViewController(ViewController, animated: true, completion: nil)
                
            } else {
                
                let alert = UIAlertController(title: "Alert", message: "Not Valid Login", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                
            }
            
        }
        
    }
    
    @IBAction func forgetPasswordAction(sender: AnyObject) {
    }
    
}