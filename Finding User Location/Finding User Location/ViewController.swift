//
//  ViewController.swift
//  Finding User Location
//
//  Created by Ryan Ruoshui Yan on 06/11/2016.
//  Copyright © 2016 Ryan Ruoshui Yan. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var map: MKMapView!
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // Get current location (latitude & longitude)
        let userLocation: CLLocation = locations[0]
        let lat = userLocation.coordinate.latitude
        let lon = userLocation.coordinate.longitude
        
        getLocationOfMap(lat: lat, lon: lon, delta: 0.05)
        // Then the location of the user will be shown at the center of the map!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getLocationOfMap(lat: CLLocationDegrees, lon: CLLocationDegrees, delta: CLLocationDegrees) {
        // Latitude緯度（橫） & Longitude經度（縱）
        
        // Coordinate坐標
        let Coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        
        // Delta縮放比例
        let latDelta: CLLocationDegrees = delta
        let lonDelta: CLLocationDegrees = delta
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        
        // Region
        let region: MKCoordinateRegion = MKCoordinateRegion(center: Coordinate, span: span)
        
        // Get Region
        map.setRegion(region, animated: true)
    }


}

