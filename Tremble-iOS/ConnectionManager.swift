//
//  ConnectionManager.swift
//  Tremble
//
//  Created by Omar Alobaid on 10/28/15.
//  Copyright © 2015 Techzone. All rights reserved.
//

import Foundation

class ConnectionManager {
    
    private let hostingUrl = "http://localhost:8080/"
    
    func login(id:String, password:String, completionHandler:(validData:Bool) -> ()) {
        
        let requestBody = "id_trainee=" + id + "&password=" + password
        let requestUrl = hostingUrl + "TrembleBackend/Login"
        
        request(requestBody, url: requestUrl) {
            
            responseData in
            
            let resultData = responseData.valueForKey("result_data")![0] as! NSDictionary
            
            var returnValue = false
            
            if resultData.valueForKey("flag")?.description == "true" {
                
                returnValue = true
                
                let defaultData = NSUserDefaults.standardUserDefaults()
                
                defaultData.setValue((resultData.valueForKey("firstname")?.description)!, forKey: "name")
                defaultData.setValue((resultData.valueForKey("mobile")?.description)!, forKey: "mobile")
                defaultData.setValue((resultData.valueForKey("email")?.description)!, forKey: "email")
                defaultData.setValue((resultData.valueForKey("subject")?.description)!, forKey: "subject")
                defaultData.setValue((resultData.valueForKey("grade")?.description)!, forKey: "grade")
                
            }
            
            completionHandler(validData: returnValue)
            
        }
        
    }
    
    func getUserSession(completionHandler:(sessionInfo:[ActiveSession]) -> ()) {
        
        let defaultData = NSUserDefaults.standardUserDefaults()
        let id = defaultData.objectForKey("SISID")?.description
        
        let requestBody = "id_trainee=" + id!
        let requestUrl = hostingUrl + "TrembleBackend/GetSessions"
        
        request(requestBody, url: requestUrl) {
            
            responseData in
            
            let json = JSON(responseData)
            
            //Array of session info
            var sessionInfoArray = [ActiveSession]()
            
            //getting JSON Data
            let location = json["result_data"][0]["location_name"].string!
            let date = json["result_data"][0]["wave_date"].string!
            
            sessionInfoArray.append(ActiveSession(location: location, date: date))
            
            completionHandler(sessionInfo: sessionInfoArray)
            
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