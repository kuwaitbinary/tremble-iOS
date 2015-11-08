//
//  ConnectionManager.swift
//  Tremble
//
//  Created by Omar Alobaid on 10/28/15.
//  Copyright © 2015 Techzone. All rights reserved.
//

import Foundation

class ConnectionManager {
    
    private let hostingUrl = "http://192.168.1.143:8080/"
    
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
    
    func forgetPassword(id:String) {
        
        let requestBody = "id_trainee=" + id
        let requestUrl = hostingUrl + "TrembleBackend/ForgetPassword"
        
        request(requestBody, url: requestUrl) {
            responseData in
        }
        
    }
    
    func editProfile(trainee:Trainee) {
        
        let defaultData = NSUserDefaults.standardUserDefaults()
        let id = defaultData.objectForKey("SISID")?.description
        
        let requestBody = "id_trainee=" + id! + "&name=" + trainee.name + "&mobile=" + trainee.mobile + "&email=" + trainee.email + "&subject=" + trainee.subject + "&grade=" + trainee.grade + "&password=" + trainee.password
        let requestUrl = hostingUrl + "TrembleBackend/EditUserProfile"
        
        request(requestBody, url: requestUrl) {
            responseData in
        }
        
    }
    
    func getUserSession(completionHandler:(sessionList:[SessionDetails]) -> ()) {
        
        let defaultData = NSUserDefaults.standardUserDefaults()
        let id = defaultData.objectForKey("SISID")?.description
        
        let requestBody = "id_trainee=" + id!
        let requestUrl = hostingUrl + "TrembleBackend/GetSessions"
        
        request(requestBody, url: requestUrl) {
            
            responseData in
            
            let resultData = responseData.valueForKey("result_data") as! NSArray
            
            var sessionInfoArray = [SessionDetails]()
            
            for (var i = 0; i < resultData.count; i++) {
                
                let evaluationFlag = resultData[i]["isEvaluationDone"]!!.description
                let className = resultData[i]["class_name"]!!.description
                let courseName = resultData[i]["course_name"]!!.description
                let locationName = resultData[i]["location_name"]!!.description
                let locationGPS = resultData[i]["location_gps"]!!.description
                let zoneName = resultData[i]["zone"]!!.description
                let trainerName = resultData[i]["trainer_name"]!!.description
                let waveDate = resultData[i]["wave_date"]!!.description
                
                let classId = resultData[i]["id_class"]!!.description
                let sessionId = resultData[i]["id_session"]!!.description
                
                defaultData.setValue(evaluationFlag, forKey: "evaluationFlag")
                defaultData.setValue(classId, forKey: "classId")
                defaultData.setValue(sessionId, forKey: "sessionId")
                defaultData.setValue(locationGPS, forKey: "location")
                
                sessionInfoArray.append(SessionDetails(className: className, courseName: courseName, locationName: locationName, locationGPS: locationGPS, zoneName: zoneName, trainerName: trainerName, waveDate: waveDate))
                
            }
            
            completionHandler(sessionList: sessionInfoArray)
            
        }
        
    }
    
    func getQuestions(completionHandler:(numberOfRows:[Int], questionList:[Question]) -> ()) {
        
        let requestBody = ""
        let requestUrl = hostingUrl + "TrembleBackend/GetQuestions"
        
        request(requestBody, url: requestUrl) {
            responseData in
            
            let sizeOfSectionOne = Int((responseData.valueForKey("first_section")?.description)!)
            let sizeOfSectionTwo = Int((responseData.valueForKey("second_section")?.description)!)
            let sizeOfSectionThird = Int((responseData.valueForKey("third_section")?.description)!)
            let sizeOfSectionFourth = Int((responseData.valueForKey("fourth_section")?.description)!)
            
            let numberOfRows:[Int] = [sizeOfSectionOne!, sizeOfSectionTwo!, sizeOfSectionThird!, sizeOfSectionFourth!]
            
            let resultData = responseData.valueForKey("result_data") as! NSArray
            
            var questionList = [Question]()
            
            for (var i = 0; i < resultData.count; i++) {
                
                let id = Int(resultData[i]["question_id"]!!.description)
                let section = Int(resultData[i]["section"]!!.description)
                let question = resultData[i]["question"]!!.description
                
                questionList.append(Question(id: id!, section: section!, question: question, answer: 0))
                
            }
            
            completionHandler(numberOfRows: numberOfRows, questionList: questionList)
            
        }
        
    }
    
    func evaluationAnswers(questionList:[Question]) {
        
        let defaultData = NSUserDefaults.standardUserDefaults()
        let id = defaultData.objectForKey("SISID")?.description
        let classId = defaultData.objectForKey("classId")?.description
        let sessionId = defaultData.objectForKey("sessionId")?.description
        
        var requestBody = "id_trainee=" + id!
        requestBody += "&id_class=" + classId!
        requestBody += "&id_session=" + sessionId!
        
        let requestUrl = hostingUrl + "TrembleBackend/EvaluationAnswers"
        
        for(var i = 0; i < questionList.count; i++) {
            
            requestBody += "&answers[]=" + questionList[i].answer.description
            
        }
        
        request(requestBody, url: requestUrl) {
            responseData in
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