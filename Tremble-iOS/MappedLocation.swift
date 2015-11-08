//
//  MappedLocation.swift
//  ContryCollection
//
//  Created by saud al azmi on 11/1/15.
//  Copyright (c) 2015 saud al azmi. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MappedLocation : NSObject , MKAnnotation {
    
    let coordinate : CLLocationCoordinate2D
    let title1 : String
    let subtitle1 : String
    
    init(coordinate : CLLocationCoordinate2D , title : String , subtitle: String) {
        self.title1 = title
        self.coordinate =  coordinate
        self.subtitle1 = subtitle
        super.init()
    }
   
}