//
//  VCPrincipal.swift
//  Primer Hito
//
//  Created by ALBERTO GURPEGUI RAMÓN on 19/3/18.
//  Copyright © 2018 ALBERTO GURPEGUI RAMÓN. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseFirestore

class VCPrincipal: UIViewController, UITableViewDataSource, UITableViewDelegate, DataHolderDelegate {
    @IBOutlet var tbMiTable:UITableView?

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return DataHolder.sharedInstance.arUsuarios.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TVCMiCelda = tableView.dequeueReusableCell(withIdentifier: "micelda1") as! TVCMiCelda
        cell.lblNombre?.text = DataHolder.sharedInstance.arUsuarios[indexPath.row].sNombre
        cell.lblEmail?.text = DataHolder.sharedInstance.arUsuarios[indexPath.row].sEmail
        cell.mostrarImagen(uri: DataHolder.sharedInstance.arUsuarios[indexPath.row].sRutaImagenP!)
        
        return cell;
    }
    func refreshUI() {
        DispatchQueue.main.async (execute:{
            self.tbMiTable?.reloadData()
        })
    }
    
    
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
                    //self.tbMiTable?.reloadData()
                    self.refreshUI()
                }
        }
       /* DataHolder.sharedInstance.firDataBaseRef.child("Usuarios").observe(DataEventType.value, with: {
            (snapshot) in
        print(snapshot)
            let arTemp=snapshot.value as? Array<AnyObject>
            
            //if(DataHolder.sharedInstance.arUsuarios==nil){
                DataHolder.sharedInstance.arUsuarios=Array<Usuario>()
            //}
            
            /*for co in arTemp! as [AnyObject]{
                let usuarioi=Usuario(valores: co as! [String:AnyObject])
                DataHolder.sharedInstance.arUsuarios?.append(usuarioi)
            }
 */
            self.tbMiTable?.reloadData()
            //let Usuario0=Usuario(valores: arTemp?[0] as! [String : AnyObject])
            //let Usuarios0=arTemp?[0] as? [String:AnyObject]
        print("EL USUARIO EN LA POSICION 0 ES: ", DataHolder.sharedInstance.arUsuarios!)
            //let postDict = snapshot.value as? [String : AnyObject] ?? [:]
        })
        
        DataHolder.sharedInstance.statusDataholder(delegate: self)
        
        // Do any additional setup after loading the view.
    }
    
    func dataHolderPruebaDataHolder(status: Int) {
        print("-------->>> ",status)
    }
    */
        func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("HE SELECCIONADO LA POSICION: %d ",indexPath.row);
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("HE DESELECCIONADO LA POSICION: %d ",indexPath.row);
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
