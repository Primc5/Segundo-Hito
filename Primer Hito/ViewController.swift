//
//  ViewController.swift
//  Primer Hito
//
//  Created by ALBERTO GURPEGUI RAMÓN on 19/3/18.
//  Copyright © 2018 ALBERTO GURPEGUI RAMÓN. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
class ViewController: UIViewController {

    @IBOutlet var btnLogear:UIButton?
    @IBOutlet var txtfUsuario:MiUITextField?
    @IBOutlet var txtfContraseña:MiUITextField?
    @IBOutlet var txtfVConsola:UITextView?
    @IBOutlet var uiswitchRecordar:UISwitch?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyBoardWhenTappedAround()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*if (DataHolder.sharedInstance.sUsuario.isEmpty) {
            logearse()
        }*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func accionBotonLogear(){
        logearse()
    }
    func logearse(){
        Auth.auth().signIn(withEmail: (txtfUsuario?.text)!, password: (txtfContraseña?.text)!) { (user, error) in
            if user != nil {
                
                let ruta = DataHolder.sharedInstance.firStoreDB?.collection("Usuarios").document((user?.uid)!)
                ruta?.getDocument{ (document, error) in
                if document != nil{
                    DataHolder.sharedInstance.usuario.setMap(valores:(document?.data())!)
                    
                    self.performSegue(withIdentifier: "trlogin", sender: self)
                }
                else{
                    print(error!)
                }
                /*if(self.uiswitchRecordar?.isOn)!{
                    DataHolder.sharedInstance.sUsuario = (self.txtfUsuario?.text)!
                    DataHolder.sharedInstance.sPassword = (self.txtfContraseña?.text)!
                    DataHolder.sharedInstance.saveData()
                     }
                */
                }
            }
            else {
                print("ERROR EN LOGEO ", error!)
            }
        }
}
}
