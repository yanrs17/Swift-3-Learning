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
        
//        let lat = userLocation.coordinate.latitude
//        let lon = userLocation.coordinate.longitude
//        getLocationOfMap(lat: lat, lon: lon, delta: 0.05)
//        // Then the location of the user will be shown at the center of the map!
        
        convertCoordicateToAddress(coordination: userLocation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func convertCoordicateToAddress(coordination: CLLocation) {
        
        CLGeocoder().reverseGeocodeLocation(coordination) {
            (placemarks, error) in
            
            if error != nil {
                print(error!)
            } else {
                if let placemark = placemarks?[0] {
                    
                    // 地標
                    print(placemark)
                    
                    // 國家
                    var country = placemark.country
                    if country == nil { // To prevent crash if it is nil
                        country = ""
                    }
                    
                    // 國家代碼
                    var isoCountryCode = placemark.isoCountryCode
                    if isoCountryCode == nil {
                        isoCountryCode = ""
                    }
                    
                    // 時區
                    print(placemark.timeZone!) // timeZone cannot be nil (?)
                    
                    // 省（州）代碼
                    var administrativeArea = placemark.administrativeArea
                    if administrativeArea == nil {
                        administrativeArea = ""
                    }
                    
                    // 市
                    var subAdministrativeArea = placemark.subAdministrativeArea
                    if subAdministrativeArea == nil {
                        subAdministrativeArea = ""
                    }
                    
                    // 縣級市（可能和市相同）
                    var locality = placemark.locality
                    if locality == nil {
                        locality = ""
                    }
                    
                    // 區域（如：大學）
                    var subLocality = placemark.subLocality
                    if subLocality == nil {
                        subLocality = ""
                    }
                    
                    // 街道
                    var thoroughfare = placemark.thoroughfare
                    if thoroughfare == nil {
                        thoroughfare = ""
                    }
                    
                    // 小街道
                    var subThoroughfare = placemark.subThoroughfare
                    if subThoroughfare == nil {
                        subThoroughfare = ""
                    }
                    
                    // 建築物名稱 Note: It is an array!
                    var areasOfInterest = placemark.areasOfInterest?[0]
                    if areasOfInterest == nil {
                        areasOfInterest = ""
                    }
                    
                    // 郵編
                    var postalCode = placemark.postalCode
                    if postalCode == nil {
                        postalCode = ""
                    }
                    
                    print(subThoroughfare! + thoroughfare!)
                    print(subLocality!)
                    print(subAdministrativeArea!)
                    print(postalCode!)
                    print(country!)
                    
                }
            }
        }
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

