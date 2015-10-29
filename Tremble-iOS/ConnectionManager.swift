//
//  ConnectionManager.swift
//  Tremble
//
//  Created by Omar Alobaid on 10/28/15.
//  Copyright © 2015 Techzone. All rights reserved.
//

import Foundation

class ConnectionManager {
    
    func login(id:String, password:String, completionHandler:(validData:Bool) -> ()) {
        
        let requestBody = "id_trainee=" + id + "&password=" + password
        let requestUrl = "http://localhost:8080/TrembleBackend/Login"
        
        request(requestBody, url: requestUrl) {
            
            responseData in
            
            var returnValue = true
            
            if responseData.valueForKey("flag")?.description == "false" {
                returnValue = false
            }
            
            completionHandler(validData: returnValue)
            
        }
        
    }
    
    func getUserProfile(completionHandler:(trainee:Trainee) -> ()) {
        
        let defaultData = NSUserDefaults.standardUserDefaults()
        let id = defaultData.objectForKey("SISID")?.description
        
        let requestBody = "id_trainee=" + id!
        let requestUrl = "http://localhost:8080/TrembleBackend/GetUserProfile"
        
        request(requestBody, url: requestUrl) {
            
            responseData in
            
            let traineeData = responseData.valueForKey("result_data")![0] as! NSDictionary
            
            var traineeProfile = Trainee()
            
            traineeProfile.firstname = (traineeData.valueForKey("first_name")?.description)!
            traineeProfile.lastname = (traineeData.valueForKey("last_name")?.description)!
            traineeProfile.mobile = (traineeData.valueForKey("mobile")?.description)!
            traineeProfile.emial = (traineeData.valueForKey("email")?.description)!
            traineeProfile.subject = (traineeData.valueForKey("subject")?.description)!
            traineeProfile.grade = (traineeData.valueForKey("grade")?.description)!
            
            completionHandler(trainee: traineeProfile)
            
        }
        
    }
    
    func request(requestBody:String, url:String, completionHandler: (responseData:NSDictionary) -> ()) {
        
        let request = NSMutableURLRequest()
        request.URL = NSURL(string: url)
        request.HTTPMethod = "POST"
        request.HTTPBody = requestBody.dataUsingEncoding(NSUTF8StringEncoding)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
            response, data, error in
            
            do {
                try completionHandler(responseData: (NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers) as? NSDictionary)!)
            } catch {
                
            }
            
        }
    }
    
}