//
//  Usuario.swift
//  Primer Hito
//
//  Created by ALBERTO GURPEGUI RAMÓN on 3/4/18.
//  Copyright © 2018 ALBERTO GURPEGUI RAMÓN. All rights reserved.
//

import UIKit

class Usuario: NSObject {
    let IDEmail = "Email"
    let IDNombre = "Nombre"
    let IDRutaImagenP = "RutaImagenP"
    let IDsFechaNacimiento = "sFechaNacimiento"
    let IDlat = "lat"
    let IDlong = "long"
    let IDVerificado = "Verificado"
    
    var sID:String?
    var sNombre:String?
    var sEmail:String?
    var bLat:Double?
    var bLong:Double?
    var sRutaImagenP:String?
    var iFechNac:String?
    var bVerificado:Bool?
    
    func setMap (valores:[String:Any]) {
        sNombre = valores[IDNombre] as? String
        sEmail = valores[IDEmail] as? String
        bLat = valores[IDlat] as? Double
        bLong = valores[IDlong] as? Double
        sRutaImagenP = valores[IDRutaImagenP] as? String
        iFechNac = valores[IDsFechaNacimiento] as? String
        bVerificado = valores[IDsFechaNacimiento] as? Bool
        //print(sNombre)
    }
    func getMap () -> [String:Any]{
        var mapTemp:[String:Any] = [:]
        mapTemp [IDEmail] = sEmail as Any
        mapTemp [IDNombre] = sNombre as Any
        mapTemp [IDRutaImagenP] = sRutaImagenP as Any
        mapTemp [IDsFechaNacimiento] = iFechNac as Any
        mapTemp [IDlat] = bLat as Any
        mapTemp [IDlong] = bLong as Any
        mapTemp [IDVerificado] = bVerificado as Any
        return mapTemp
    }
}
