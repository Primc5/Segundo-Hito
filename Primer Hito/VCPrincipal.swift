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

class VCPrincipal: UIViewController, UITableViewDataSource, UITableViewDelegate, DataHolderDelegate {
    
    @IBOutlet var tbMiTable:UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    DataHolder.sharedInstance.firDataBaseRef.child("Usuarios").observe(DataEventType.value, with: {
            (snapshot) in
            let arTemp=snapshot.value as? Array<AnyObject>
            
            //if(DataHolder.sharedInstance.arUsuarios==nil){
                DataHolder.sharedInstance.arUsuarios=Array<Usuario>()
            //}
            
            for co in arTemp! as [AnyObject]{
                let usuarioi=Usuario(valores: co as! [String:AnyObject])
                DataHolder.sharedInstance.arUsuarios?.append(usuarioi)
            }
            self.tbMiTable?.reloadData()
            //let Usuario0=Usuario(valores: arTemp?[0] as! [String : AnyObject])
            //let Usuarios0=arTemp?[0] as? [String:AnyObject]
            print("EL USUARIO EN LA POSICION 0 ES: ", DataHolder.sharedInstance.arUsuarios)
            //let postDict = snapshot.value as? [String : AnyObject] ?? [:]
        })
        
        DataHolder.sharedInstance.statusDataholder(delegate: self)
        
        // Do any additional setup after loading the view.
    }
    
    func DataHolderPruebaDataHolder(status: Int) {
        print("-------->>> ",status)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (DataHolder.sharedInstance.arUsuarios==nil) {
            return 0
        }
        else{
            return (DataHolder.sharedInstance.arUsuarios?.count)!;
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TVCMiCelda = tableView.dequeueReusableCell(withIdentifier: "micelda1") as! TVCMiCelda
        
        let usuarioi:Usuario=DataHolder.sharedInstance.arUsuarios![indexPath.row]
        cell.lblNombre?.text=usuarioi.sNombre
        //cell.lblNombre?.text="Yony"
        /*if (indexPath.row==0) {
            cell.lblNombre?.text="Yony"
        }
        else if (indexPath.row==1){
            cell.lblNombre?.text="Javi"
        }
        else if (indexPath.row==2){
            cell.lblNombre?.text="Victor"
        }
        else if (indexPath.row==3){
            cell.lblNombre?.text="Nacho"
        }
        else if (indexPath.row==4){
            cell.lblNombre?.text="Alvaro"
        }*/
        return cell;
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
