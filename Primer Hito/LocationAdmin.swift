//
//  LocationAdmit.swift
//  Primer Hito
//
//  Created by ALBERTO GURPEGUI RAMÓN on 21/3/18.
//  Copyright © 2018 ALBERTO GURPEGUI RAMÓN. All rights reserved.
//

import UIKit
import CoreLocation
class LocationAdmit: NSObject,CLLocationManagerDelegate {
    
    var locationManager:CLLocationManager?
    
    override init() {
        super.init()
        
        locationManager=CLLocationManager()
        locationManager?.delegate=self
        locationManager?.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        print("mi pos en lat: ",locations[0].coordinate," long: ",locations[0].coordinate.longitude)
    }
}
