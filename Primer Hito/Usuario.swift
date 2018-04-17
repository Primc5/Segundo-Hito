//
//  Usuario.swift
//  Primer Hito
//
//  Created by ALBERTO GURPEGUI RAMÓN on 3/4/18.
//  Copyright © 2018 ALBERTO GURPEGUI RAMÓN. All rights reserved.
//

import UIKit

class Usuario: NSObject {
    
    var sNombre:String?
    var sEmail:String?
    var bLat:Double?
    var bLong:Double?
    var sRutaImagenP:String?
    var iFechNac:String?
    
    func setMap (valores:[String:Any]) {
        sNombre = valores["Nombre"] as? String
        sEmail = valores["Email"] as? String
        bLat = valores["lat"] as? Double
        bLong = valores["long"] as? Double
        sRutaImagenP = valores["RutaImagenP"] as? String
        iFechNac = valores["sFechaNacimiento"] as? String
        print(sNombre)
    }
    func getMap () -> [String:Any]{
        var mapTemp:[String:Any] = [:]
        mapTemp ["Email"] = sEmail as Any
        mapTemp ["Nombre"] = sNombre as Any
        mapTemp ["RutaImagenP"] = sRutaImagenP as Any
        mapTemp ["sFechaNacimiento"] = iFechNac as Any
        mapTemp ["lat"] = bLat as Any
        mapTemp ["long"] = bLong as Any
        return mapTemp
    }
}
