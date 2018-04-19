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
import FirebaseFirestore

class DataHolder: NSObject { 
    
    static let sharedInstance:DataHolder=DataHolder()
    var numeroCeldasColeccion:UInt=5;
    var locationAdmin:LocationAdmin?
    var firDataBaseRef: DatabaseReference!
    var firStorage:Storage?
    var arUsuarios:[Usuario] = []
    var firStorageRef:StorageReference?
    var hmImagenesDescargadas:[String:UIImage]?=[:]
    var sUsuario:String = ""
    var sPassword:String = ""
    var iFechNac:String = ""
    var dbLat:String = ""
    var dbLong:String = ""
    var firStoreDB:Firestore?
    var usuario:Usuario = Usuario()
    
    func initFireBase(){
        FirebaseApp.configure()
        firDataBaseRef = Database.database().reference()
        firStorage = Storage.storage()
        firStoreDB=Firestore.firestore()
    }
    
    func initLocationAdmin(){
        locationAdmin=LocationAdmin()
    }
    
    func loadData(){
        let props = UserDefaults.standard
        //sUsuario = props.string(forKey: "usuario_login")!
        //sPassword = props.string(forKey: "password_login")!
    }
    
    func saveData(){
        let props = UserDefaults.standard
        props.setValue(sUsuario, forKey: "usuario_login")
        props.setValue(sPassword, forKey: "password_login")
        props.synchronize()
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
    
    func setDownloadedImage(clave:String, imagenDes image:UIImage){
        hmImagenesDescargadas![clave]=image
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
