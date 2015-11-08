//
//  Question.swift
//  Tremble-iOS
//
//  Created by Omar Alobaid on 11/3/15.
//  Copyright © 2015 Techzone. All rights reserved.
//

import Foundation

import Foundation

class Question {
    
    var id:Int
    var section:Int
    var question:String
    var answer:Int
    
    init() {
        self.id = 0
        self.section = 0
        self.question = ""
        self.answer = 0
    }
    
    init(id:Int, section:Int, question:String, answer:Int) {
        
        self.id = id
        self.section = section
        self.question = question
        self.answer = answer
        
    }
    
}