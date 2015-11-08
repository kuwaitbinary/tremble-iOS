//
//  MapViewController.swift
//  Tremble-iOS
//
//  Created by Omar Alobaid on 11/5/15.
//  Copyright © 2015 Techzone. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController,MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager();

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestAlwaysAuthorization();
        locationManager.requestWhenInUseAuthorization()
        
        viewMap()
    }
    
    func viewMap() {
        
        let defaultData = NSUserDefaults.standardUserDefaults()
        let location = defaultData.objectForKey("location")?.description
        
        var coordinates:[String] = location!.characters.split { $0 == ";" }.map(String.init)
        
        var lat=(coordinates[0] as NSString).doubleValue
        var lon=(coordinates[1] as NSString).doubleValue
        
        locationManager.startUpdatingLocation();
        self.mapView.delegate = self
        let singleLocation = CLLocationCoordinate2DMake(lat, lon)
        let dropPin = MKPointAnnotation()
        dropPin.coordinate = singleLocation
        
        let span = MKCoordinateSpanMake(0.03,0.03)
        let region = MKCoordinateRegionMake(singleLocation, span)
        self.mapView.setRegion(region, animated: true)
        let mappedLocation = MappedLocation(coordinate: singleLocation , title: "", subtitle: "")
        
        mapView.addAnnotation(mappedLocation)
        
    }

}