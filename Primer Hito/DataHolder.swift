//
//  DataHolder.swift
//  Primer Hito
//
//  Created by ALBERTO GURPEGUI RAMÓN on 20/3/18.
//  Copyright © 2018 ALBERTO GURPEGUI RAMÓN. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
class DataHolder: NSObject {
    
    static let sharedInstance:DataHolder=DataHolder()
    var numeroCeldasColeccion:UInt=5;
    var locationAdmin:LocationAdmin?
    var firDataBaseRef: DatabaseReference!
    
    func initFireBase(){
        FirebaseApp.configure()
        firDataBaseRef = Database.database().reference()
    }
    func initLocationAdmin(){
        locationAdmin=LocationAdmin()
    }
}
