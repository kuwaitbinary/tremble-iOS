//
//  LoginViewController.swift
//  Tremble-iOS
//
//  Created by Omar Alobaid on 10/28/15.
//  Copyright © 2015 Techzone. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let manager = ConnectionManager()
    
    @IBOutlet weak var idOutlet: UITextField!
    @IBOutlet weak var passwordOutlet: UITextField!
    
    @IBAction func loginAction(sender: AnyObject) {
        
        //check if the there is empty fields
        
        manager.login(idOutlet.text!, password: passwordOutlet.text!) { (validData) -> () in
            
            if validData {
                
                let defaultData = NSUserDefaults.standardUserDefaults()
                defaultData.setValue(self.idOutlet.text, forKey: "SISID")
                defaultData.setValue(self.passwordOutlet.text, forKey: "password")
                
                let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
                let ViewController = mainStoryboard.instantiateViewControllerWithIdentifier("HomeScreen") as UIViewController
                
                let navigationController = UINavigationController(rootViewController: ViewController)
                
                self.presentViewController(navigationController, animated: true, completion: nil)
                
            } else {
                
                let alert = UIAlertController(title: "Alert", message: "Not Valid Login", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                
            }
            
        }
        
    }
    
    @IBAction func forgetPasswordAction(sender: AnyObject) {
        
        let alert = UIAlertController(title: "Alert", message: "Please Enter Your SISID", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            
            textField.placeholder = "SISID"
            textField.keyboardType = UIKeyboardType.NumberPad
            
        }
        
        alert.addAction(UIAlertAction (title: "Submit", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            
            let textField = alert.textFields![0] as UITextField
            
            self.manager.forgetPassword(textField.text!)
            
            let alert = UIAlertController(title: "Alert", message: "An Email is sent with the new password.", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
}