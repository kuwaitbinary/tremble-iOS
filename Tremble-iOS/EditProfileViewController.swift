//
//  EditProfileViewController.swift
//  Tremble-iOS
//
//  Created by Omar Alobaid on 11/1/15.
//  Copyright © 2015 Techzone. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    private var errorMessage = ""

    @IBOutlet weak var nameOutlet: UITextField!
    @IBOutlet weak var mobilePhoneOutlet: UITextField!
    @IBOutlet weak var emailOutlet: UITextField!
    @IBOutlet weak var subjectOutlet: UITextField!
    @IBOutlet weak var gradeOutlet: UITextField!
    @IBOutlet weak var newPasswordOutlet: UITextField!
    @IBOutlet weak var confirmNewPasswordOutlet: UITextField!
    
    @IBAction func submitAction(sender: AnyObject) {
        
        errorMessage = ""
        
        if validInput() {
         
            let trainee = Trainee(name: nameOutlet.text!, grade: gradeOutlet.text!, subject: subjectOutlet.text!, mobile: mobilePhoneOutlet.text!, email: emailOutlet.text!, password: newPasswordOutlet.text!)
            
            let manager = ConnectionManager()
            
            manager.editProfile(trainee)
            
            let defaultData = NSUserDefaults.standardUserDefaults()
            
            defaultData.setValue(nameOutlet.text, forKey: "name")
            defaultData.setValue(mobilePhoneOutlet.text, forKey: "mobile")
            defaultData.setValue(emailOutlet.text, forKey: "email")
            defaultData.setValue(subjectOutlet.text, forKey: "subject")
            defaultData.setValue(gradeOutlet.text, forKey: "grade")
            
            navigationController?.popViewControllerAnimated(true)
            
        } else {
            
            let alert = UIAlertController(title: "Alert", message: errorMessage, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let defaultData = NSUserDefaults.standardUserDefaults()
        
        let name = defaultData.objectForKey("name")?.description
        let email = defaultData.objectForKey("email")?.description
        let mobile = defaultData.objectForKey("mobile")?.description
        let subject = defaultData.objectForKey("subject")?.description
        let grade = defaultData.objectForKey("grade")?.description
        let password = defaultData.objectForKey("password")?.description
        
        nameOutlet.text = name
        emailOutlet.text = email
        mobilePhoneOutlet.text = mobile
        subjectOutlet.text = subject
        gradeOutlet.text = grade
        newPasswordOutlet.text = password
        confirmNewPasswordOutlet.text = password
        
    }
    
    func validInput() -> Bool {
        
        var vaild = true
        
        if nameOutlet.text == "" || mobilePhoneOutlet.text == "" || emailOutlet.text == "" || newPasswordOutlet.text == "" || confirmNewPasswordOutlet.text == "" {
            
            errorMessage += "Empty feilds. Please fill them."
            vaild = false
            
        }
        
        if validPhone(mobilePhoneOutlet.text!) == false {
            
            errorMessage += "Invalid Phone Number. Please enter a valid phone number."
            vaild = false
            
        }
        
        if validEmail(emailOutlet.text!) == false {
            
            errorMessage += "Invalid email. Please enter a valid email."
            vaild = false
            
        }
        
        if newPasswordOutlet.text != confirmNewPasswordOutlet.text {
            
            errorMessage += "Password not confimed."
            vaild = false
            
        }
        
        return vaild
        
    }
    
    func validEmail(email:String) -> Bool {
        
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(email)
        
    }
    
    func validPhone(phone:String) -> Bool {
        
        if phone.characters.count == 12 {
            return true
        } else {
            return false
        }
        
    }
    
}