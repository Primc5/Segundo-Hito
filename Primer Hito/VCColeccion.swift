//
//  VCColeccion.swift
//  Primer Hito
//
//  Created by ALBERTO GURPEGUI RAMÓN on 20/3/18.
//  Copyright © 2018 ALBERTO GURPEGUI RAMÓN. All rights reserved.
//

import UIKit
import FirebaseFirestore

class VCColeccion: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int(DataHolder.sharedInstance.numeroCeldasColeccion);
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CVCMiCelda2 = collectionView.dequeueReusableCell(withReuseIdentifier: "micelda2", for: indexPath) as! CVCMiCelda2
        cell.lblNombre?.text = DataHolder.sharedInstance.arUsuarios[indexPath.row].sNombre
        cell.mostrarImagen(uri: DataHolder.sharedInstance.arUsuarios[indexPath.row].sRutaImagenP!)
        
        return cell;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet var colPrincipal:UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        DataHolder.sharedInstance.firStoreDB?.collection("Usuarios").whereField("Verificado", isEqualTo: true).addSnapshotListener { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                DataHolder.sharedInstance.arUsuarios=[]
                for document in querySnapshot!.documents {
                    
                    let usuario:Usuario = Usuario()
                    usuario.sID=document.documentID
                    usuario.setMap(valores: document.data())
                    DataHolder.sharedInstance.arUsuarios.append(usuario)
                    
                    print("\(document.documentID) => \(document.data())")
                }
                print("->",DataHolder.sharedInstance.arUsuarios.count)
                
            }
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
}
