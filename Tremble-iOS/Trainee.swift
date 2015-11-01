//
//  Trainee.swift
//  Tremble
//
//  Created by Abduallah Al Mashmoum on 10/27/15.
//  Copyright © 2015 Techzone. All rights reserved.
//

import Foundation

class Trainee {
    
    var name:String
    var mobile:String
    var email:String
    var grade:String
    var subject:String
    var password:String
    
    init() {
        self.name = ""
        self.grade = ""
        self.subject = ""
        self.email = ""
        self.mobile = ""
        self.password = ""
    }
    
    init(name:String, grade:String, subject:String, mobile:String, email:String, password:String) {
        self.name = name
        self.grade = grade
        self.subject = subject
        self.email = email
        self.mobile = mobile
        self.password = password
    }
    
}