//
//  DataHolder.swift
//  Primer Hito
//
//  Created by ALBERTO GURPEGUI RAMÓN on 20/3/18.
//  Copyright © 2018 ALBERTO GURPEGUI RAMÓN. All rights reserved.
//

import UIKit
import Firebase
class DataHolder: NSObject {
    
    static let sharedInstance:DataHolder=DataHolder()
    var numeroCeldasColeccion:UInt=20;
    var locationAdmin:LocationAdmin?
    
    func initFireBase(){
        FirebaseApp.configure()
    }
    func initLocationAdmin(){
        locationAdmin=LocationAdmin()
    }
    func nombreDeCelda(numero:Int) -> NSString {
        if (numero==0) {
            return "Alberto"
        }
        else if (numero==1){
            return "Javi"
        }
        else if (numero==2){
            return "Victor"
        }
        else if (numero==3){
            return "Nacho"
        }
        else if (numero==4){
            return "Alvaro"
        }
        return "";
    }

}
