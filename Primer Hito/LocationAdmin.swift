//
//  LocationAdmit.swift
//  Primer Hito
//
//  Created by ALBERTO GURPEGUI RAMÓN on 21/3/18.
//  Copyright © 2018 ALBERTO GURPEGUI RAMÓN. All rights reserved.
//

import UIKit
import CoreLocation

class LocationAdmin: NSObject,CLLocationManagerDelegate {
    
    var locationManager:CLLocationManager?
    var delegate:LocationAdminDelegate?
    
    override init() {
        super.init()
        
        locationManager=CLLocationManager()
        locationManager?.delegate=self
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        print("mi pos en lat: ",locations[0].coordinate.latitude," long: ",locations[0].coordinate.longitude)
        delegate?.localizacionActualizada(coordenada: locations[0].coordinate)
    }
}
protocol LocationAdminDelegate {
    func localizacionActualizada(coordenada:CLLocationCoordinate2D)
    
    
}
