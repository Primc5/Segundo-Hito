//
//  VCRegister.swift
//  Primer Hito
//
//  Created by ALBERTO GURPEGUI RAMÓN on 19/3/18.
//  Copyright © 2018 ALBERTO GURPEGUI RAMÓN. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class VCRegister: UIViewController {
    
    @IBOutlet var txtfEmail:UITextField?
    @IBOutlet var txtfUsuario:UITextField?
    @IBOutlet var iFechaNac:UITextField?
    @IBOutlet var txtfContraseña:UITextField?
    @IBOutlet var txtfRepetirContraseña:UITextField?
    @IBOutlet var dLat:UITextField?
    @IBOutlet var dLong:UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtfUsuario?.text = DataHolder.sharedInstance.sUsuario
        iFechaNac?.text = DataHolder.sharedInstance.iFechNac
        dLat?.text = DataHolder.sharedInstance.dbLat
        dLong?.text = DataHolder.sharedInstance.dbLong
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func accionBotonRegistrar(){
        DataHolder.sharedInstance.usuario.sEmail = txtfEmail?.text
        DataHolder.sharedInstance.usuario.sNombre = txtfUsuario?.text
        DataHolder.sharedInstance.usuario.iFechNac = iFechaNac?.text
        DataHolder.sharedInstance.usuario.sRutaImagenP = "Android.png"
        DataHolder.sharedInstance.usuario.bVerificado = true
        DataHolder.sharedInstance.usuario.bLat = Double("dLat?.text")
        DataHolder.sharedInstance.usuario.bLong = Double("dLong?.text")
        Auth.auth().createUser(withEmail: (txtfEmail?.text)!, password: (txtfContraseña?.text)!) { (user, error) in
            if user != nil {
                print("TE REGISTRASTE")
            DataHolder.sharedInstance.firStoreDB?.collection("Usuarios").document((user?.uid)!).setData(DataHolder.sharedInstance.usuario.getMap())
                self.performSegue(withIdentifier: "trregistro", sender: self)
            }
           else{
                print("ERROR EN REGISTRO ", error!)
            }
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
