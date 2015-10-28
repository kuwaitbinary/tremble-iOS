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
        
        let manager = ConnectionManager();
        
        manager.login(idOutlet.text!, password: passwordOutlet.text!) { (validData) -> () in
            
            if validData {
                
                let alert = UIAlertController(title: "Alert", message: "Valid Login", preferredStyle: UIAlertControllerStyle.Alert)
                //alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                
            } else {
                
                let alert = UIAlertController(title: "Alert", message: "Not Valid Login", preferredStyle: UIAlertControllerStyle.Alert)
                //alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                
            }
            
        }
        
    }
    
    @IBAction func forgetPasswordAction(sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
