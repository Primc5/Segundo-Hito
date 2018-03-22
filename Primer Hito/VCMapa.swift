//
//  VCMapa.swift
//  Primer Hito
//
//  Created by ALBERTO GURPEGUI RAMÓN on 22/3/18.
//  Copyright © 2018 ALBERTO GURPEGUI RAMÓN. All rights reserved.
//

import UIKit
import MapKit

class VCMapa: UIViewController, MKMapViewDelegate{
    
    @IBOutlet var miMapa:MKMapView?

    override func viewDidLoad() {
        super.viewDidLoad()
        miMapa?.showsUserLocation = true
        
        //miMapa?.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func localizacionActualizada(coordenada: CLLocationCoordinate2D) {
        centralizarEnPosicion(coordenada: coordenada)
    }
    
    func centralizarEnPosicion(coordenada:CLLocationCoordinate2D) {
        let region:MKCoordinateRegion = MKCoordinateRegion(center:coordenada, span:MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05 ))
        miMapa?.setRegion(region, animated: true)
        
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation:MKUserLocation){
        centralizarEnPosicion(coordenada: userLocation.coordinate)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
