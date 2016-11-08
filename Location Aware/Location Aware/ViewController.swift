//
//  ViewController.swift
//  Location Aware
//
//  Created by Ryan Ruoshui Yan on 07/11/2016.
//  Copyright © 2016 Ryan Ruoshui Yan. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var lat: UILabel!
    @IBOutlet weak var lon: UILabel!
    @IBOutlet weak var course: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var alt: UILabel!
    @IBOutlet weak var addr: UILabel!
    
    var locationManager = CLLocationManager()
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // Get current location (latitude & longitude)
        let userLocation: CLLocation = locations[0]
        
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        convertCoordicateToAddress(coordination: userLocation)
        
        lat.text = "Latitude: \(latitude)"
        lon.text = "Longitude: \(longitude)"
        course.text = "Course: \(userLocation.course)"
        speed.text = "Speed: \(userLocation.speed)"
        alt.text = "Altitude: \(userLocation.altitude)"
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
                    
//                    var address = ""
//                    address += (subThoroughfare! + thoroughfare! + "\n")
//                    address += (subLocality! + "\n)
//                    address += (subAdministrativeArea! + "\n)
//                    address += (postalCode! + "\n)
//                    address += (country!)
                    
                    self.addr.text = "Nearest Address:\n \(subThoroughfare!) \(thoroughfare!)\n \(subLocality!)\n \(subAdministrativeArea!)\n \(postalCode!)\n \(country!)"
                    
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

