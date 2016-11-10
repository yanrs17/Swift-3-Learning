//
//  ViewController.swift
//  Memorable Places
//
//  Created by Ryan Ruoshui Yan on 09/11/2016.
//  Copyright © 2016 Ryan Ruoshui Yan. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

extension MKMapView {
    func zoomOut(_ zoomLevel: Int) {
        var mapRegion = self.region
        var mapSpan = self.region.span
        
        if ((mapSpan.latitudeDelta * Double(zoomLevel)) <= 180 && (mapSpan.longitudeDelta * Double(zoomLevel)) < 360) {
            mapSpan.latitudeDelta *= Double(zoomLevel)
            mapSpan.longitudeDelta *= Double(zoomLevel)
        }
        
        mapRegion.span = mapSpan
        setRegion(mapRegion, animated: true)
    }
}

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    
    @IBAction func zoomOut(_ sender: Any) {
        map.zoomOut(2)
    }
//    @IBAction func zoomOutButton(_ sender: UIButton) {
//    }
    
    var locationManager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // Get current location (latitude & longitude)
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        self.map.setRegion(region, animated: true)
        // Then the location of the user will be shown at the center of the map!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Add uilpgr to the map
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpressWithAddress(gestureRecognizer:)))
        // Do not miss ":"!! After long press, longpress() is called
        uilpgr.minimumPressDuration = 1 // Usually 1, 1.5 or 2
        map.addGestureRecognizer(uilpgr)
        
        if activePlace == -1 {
            
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
            
        } else {
        
            if activePlace < places.count {
                if let name = places[activePlace]["name"] {
                    if let lat = places[activePlace]["lat"] {
                        if let lon = places[activePlace]["lon"] {
                            if let latitude = Double(lat) {
                                if let longitude = Double(lon) {
                                    let coord = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                                    getLocationOfMap(lat: latitude, lon: longitude, delta: 0.05)
                                    annotateOnMap(map: map, title: name, subtitle: "", coordinate: coord)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    // Annotate with long press
    func longpressWithAddress(gestureRecognizer: UIGestureRecognizer) {

        if gestureRecognizer.state == UIGestureRecognizerState.began {
            // Get coord on the map
            let touchPoint = gestureRecognizer.location(in: self.map)
            let coord = map.convert(touchPoint, toCoordinateFrom: self.map)
            let location = CLLocation(latitude: coord.latitude, longitude: coord.longitude)
            var title = ""
            var subtitle = ""
            
            CLGeocoder().reverseGeocodeLocation(location) {
                (placemarks, error) in
                
                if error != nil {
                    print(error!)
                } else {
                    if let placemark = placemarks?[0] {
                        
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
                        
                        title += subThoroughfare! + " " + thoroughfare!
                        
                        if title.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == "" {
                            title += "\(NSDate())"
                        } else {
                            subtitle += "\(NSDate())"
                        }
                        
                        // Annotate
                        self.annotateOnMap(map: self.map, title: title, subtitle: subtitle, coordinate: coord)
                        
                        places.append(["name": title, "lat": String(coord.latitude), "lon": String(coord.latitude)])
                        
                        UserDefaults.standard.set(places, forKey: "places")
                        
                    }
                }
            }
        }
    }
    
    func annotateOnMap(map: MKMapView, title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.title = title
        annotation.subtitle = subtitle
        annotation.coordinate = coordinate
        map.addAnnotation(annotation)
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

