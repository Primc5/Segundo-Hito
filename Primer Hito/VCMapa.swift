//
//  VCMapa.swift
//  Primer Hito
//
//  Created by ALBERTO GURPEGUI RAMÓN on 22/3/18.
//  Copyright © 2018 ALBERTO GURPEGUI RAMÓN. All rights reserved.
//

import UIKit
import MapKit
import FirebaseDatabase
import FirebaseFirestore

class VCMapa: UIViewController, MKMapViewDelegate{
    
    @IBOutlet var miMapa:MKMapView?
    var pines:[String:MKAnnotation]? = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        miMapa?.showsUserLocation = true
        
        for usuario in DataHolder.sharedInstance.arUsuarios {
            
            var coordTemp:CLLocationCoordinate2D = CLLocationCoordinate2D()
            coordTemp.latitude = usuario.bLat!
            coordTemp.longitude = usuario.bLong!
            self.agregarPin(coordenada: coordTemp, titulo: usuario.sNombre!)
        }
        //miMapa?.delegate = self
        // Do any additional setup after loading the view.
        /*
        var coordTemp:CLLocationCoordinate2D = CLLocationCoordinate2D()
        coordTemp.latitude = 40.540290
        coordTemp.longitude = -3.893893
        agregarPin(coordenada: coordTemp, titulo: " PIN1 ")
        var coordTemp2:CLLocationCoordinate2D = CLLocationCoordinate2D()
        coordTemp.latitude = 40.540288
        coordTemp.longitude = -3.893893
        agregarPin(coordenada: coordTemp2, titulo: " PIN2 ")
        var coordTemp3:CLLocationCoordinate2D = CLLocationCoordinate2D()
        coordTemp.latitude = 40.540290
        coordTemp.longitude = -3.893896
        agregarPin(coordenada: coordTemp2, titulo: " PIN3 ")*/
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func agregarPin(coordenada:CLLocationCoordinate2D, titulo varTitulo:String) {
        var annotation:MKPointAnnotation = MKPointAnnotation()
        
        if (pines?[varTitulo] == nil) {
            
        }else{
            annotation = pines?[varTitulo] as! MKPointAnnotation
            miMapa?.removeAnnotation(annotation)
        }
        
        annotation.coordinate = coordenada
        annotation.title = varTitulo
        pines?[varTitulo] = annotation
        miMapa?.addAnnotation(annotation)
    }
    
    func centralizarEnPosicion(coordenada:CLLocationCoordinate2D) {
        let region:MKCoordinateRegion = MKCoordinateRegion(center:coordenada, span:MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
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
