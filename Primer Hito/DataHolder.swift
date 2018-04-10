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
import FirebaseStorage

class DataHolder: NSObject {
    
    static let sharedInstance:DataHolder=DataHolder()
    var numeroCeldasColeccion:UInt=5;
    var locationAdmin:LocationAdmin?
    var firDataBaseRef: DatabaseReference!
    var firStorage:Storage?
    var arUsuarios:Array<Usuario>?
    var firStorageRef:StorageReference?
    var hmImagenesDescargadas:[String:UIImage]?=[:]
    //var delegate:DataHolderDelegate?
    
    
    func initFireBase(){
        FirebaseApp.configure()
        firDataBaseRef = Database.database().reference()
        firStorage = Storage.storage()
        firStorageRef = firStorage?.reference()
    }
    func initLocationAdmin(){
        locationAdmin=LocationAdmin()
    }
    func getImage(clave:String, getDelegate delegate:DataHolderDelegate){
        if(self.hmImagenesDescargadas?[clave] == nil){
            let islandRef = self.firStorageRef?.child(clave)
            
            islandRef?.getData(maxSize: 1 * 1024 * 1024) { data, error in
                if error != nil {
                    // Uh-oh, an error occurred!
                } else {
                    // Data for "images/island.jpg" is returned
                    let image = UIImage(data: data!)
                    self.hmImagenesDescargadas?[clave] = image
                    delegate.dataHolderImagenDescargada!(imagen:image!)
                }
            }
        }
        else{
            delegate.dataHolderImagenDescargada!(imagen:(self.hmImagenesDescargadas?[clave])!)
        }
    }
    func statusDataholder(delegate:DataHolderDelegate){
        var i = 0
        while i<1000000000 {
            i += 1
        }
        delegate.dataHolderPruebaDataHolder!(status: 0)
    }
}
@objc protocol DataHolderDelegate{
    @objc optional func dataHolderImagenDescargada(imagen:UIImage)
    @objc optional func dataHolderPruebaDataHolder(status:Int)
}
