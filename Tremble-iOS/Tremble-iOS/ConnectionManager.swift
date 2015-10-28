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
        let requestUrl = ""
        
        request(requestBody, url: requestUrl) {
            
            responseData in
            
            var returnValue = true
            
            if responseData.valueForKey("flag")?.description == "false" {
                returnValue = false
            }
            
            completionHandler(validData: returnValue)
            
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
