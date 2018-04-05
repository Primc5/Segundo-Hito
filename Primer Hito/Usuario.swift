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
    var sApellidos:String?
    var sEmail:Character?
    var dbLat:Double?
    var dbLong:Double?
    var sRutaImagenP:String?
    
    init (valores:[String:AnyObject]) {
        sNombre = valores["Nombre"] as? String
        sApellidos = valores["Apellidos"] as? String
        sEmail = valores["Email"] as? Character
        dbLat = valores["lat"] as? Double
        dbLong = valores["long"] as? Double
        sRutaImagenP = valores["RutaImagenP"] as? String
    }
}
