//
//  ViewController.swift
//  maps
//
//  Created by Ryan Ruoshui Yan on 06/11/2016.
//  Copyright © 2016 Ryan Ruoshui Yan. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Latitude緯度（橫） & Longitude經度（縱）
        let lat: CLLocationDegrees = 43.664358
        let lon: CLLocationDegrees = -79.4005263
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        
        // Delta縮放比例
        let latDelta: CLLocationDegrees = 0.01
        let lonDelta: CLLocationDegrees = 0.01
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        
        // Region
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
        // Get Region
        map.setRegion(region, animated: true)
        
        // Annotate on the map
        annotateOnMap(map: map, title: "Robarts Library", subtitle: "I am currently here.", coordinate: location)
        
        // Add uilpgr to the map
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognizer:)))
        // Do not miss ":"!! After long press, longpress() is called
        uilpgr.minimumPressDuration = 1
        map.addGestureRecognizer(uilpgr)
    }
    
    // Annotate with long press
    func longpress(gestureRecognizer: UIGestureRecognizer) {
        
        // Get coord on the map
        let touchPoint = gestureRecognizer.location(in: self.map)
        let coord = map.convert(touchPoint, toCoordinateFrom: self.map)
        
        // Annotate
        annotateOnMap(map: map, title: "New Place", subtitle: "Somewhere", coordinate: coord)
    }
    
    // Annotate on the map
    func annotateOnMap(map: MKMapView, title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
        
        let annotation = MKPointAnnotation()
        annotation.title = title
        annotation.subtitle = subtitle
        annotation.coordinate = coordinate
        map.addAnnotation(annotation)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

