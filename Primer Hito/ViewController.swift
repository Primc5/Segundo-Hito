//
//  ViewController.swift
//  Primer Hito
//
//  Created by ALBERTO GURPEGUI RAMÓN on 19/3/18.
//  Copyright © 2018 ALBERTO GURPEGUI RAMÓN. All rights reserved.
//

import UIKit
import FirebaseAuth
class ViewController: UIViewController {

    @IBOutlet var btnLogear:UIButton?
    @IBOutlet var txtfUsuario:UITextField?
    @IBOutlet var txtfContraseña:UITextField?
    @IBOutlet var txtfVConsola:UITextView?
    @IBOutlet var uiswitchRecordar:UISwitch?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        txtfUsuario?.text = DataHolder.sharedInstance.sUsuario
        txtfContraseña?.text = DataHolder.sharedInstance.sPassword
        
        if (DataHolder.sharedInstance.sUsuario?.isEmpty)! {
            logearse()
        }
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
            if (error==nil){
                if(self.uiswitchRecordar?.isOn)!{
                    DataHolder.sharedInstance.sUsuario = self.txtfUsuario?.text
                    DataHolder.sharedInstance.sPassword = self.txtfContraseña?.text
                    DataHolder.sharedInstance.saveData()
                }
                self.performSegue(withIdentifier: "trlogin", sender: self)
            }
            else{
                print("ERROR EN LOGEO ", error!)
            }
        }
    }
}
