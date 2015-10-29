//
//  SessionConnection.swift
//  Tremble-iOS
//
//  Created by Abduallah Al Mashmoum on 10/29/15.
//  Copyright © 2015 Techzone. All rights reserved.
//

import Foundation

class SessionInfo {
    
    var location: String
    var date: String
    
    init(){
    location = ""
    date = ""
    }
    
    init (location:String, date:String ) {
     
        self.location = location
        self.date = date
        
    }
    
}

class SessionConnection {

    
    func getUserSession(completionHandler:(sessionInfo:[SessionInfo]) -> ()) {
        
//        let defaultData = NSUserDefaults.standardUserDefaults()
//       let id = defaultData.objectForKey("SISID")?.description
        let id = "1"
        
        let requestBody = "id_trainee=" + id
        let requestUrl = "http://192.168.1.188:8080/TrembleBackend/GetSessions"
        
        request(requestBody, url: requestUrl) {
            
            responseData in
            
            let json = JSON(responseData)
            
            
            //Array of session info
            var sessionInfoArray = [SessionInfo]()
            
            //getting JSON Data
            let location = json["result_data"][0]["location_name"].string!
            let date = json["result_data"][0]["wave_date"].string!
            
            sessionInfoArray.append(SessionInfo(location: location, date: date))

            
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