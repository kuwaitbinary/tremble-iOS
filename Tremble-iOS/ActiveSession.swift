//
//  ActiveSession.swift
//  Tremble
//
//  Created by Abduallah Al Mashmoum on 10/27/15.
//  Copyright © 2015 Techzone. All rights reserved.
//

import Foundation

class ActiveSession {
    
//    var idSession:Int
//    
//    init (idSession:Int) {
//        
//        self.idSession = idSession
//        
//    }
    
    
    
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