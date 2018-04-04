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
    var arUsuarios:Array<Usuario>?
    //var delegate:DataHolderDelegate?
    
    
    func initFireBase(){
        FirebaseApp.configure()
        firDataBaseRef = Database.database().reference()
    }
    func initLocationAdmin(){
        locationAdmin=LocationAdmin()
    }
    func statusDataholder(delegate:DataHolderDelegate){
        var i = 0
        while i<1000000000 {
            i += 1
        }
        delegate.DataHolderPruebaDataHolder!(status: 0)
    }
}
@objc protocol DataHolderDelegate{
    @objc optional func DataHolderPruebaDataHolder(status:Int)
}
