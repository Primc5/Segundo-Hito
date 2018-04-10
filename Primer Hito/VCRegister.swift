//
//  VCRegister.swift
//  Primer Hito
//
//  Created by ALBERTO GURPEGUI RAMÓN on 19/3/18.
//  Copyright © 2018 ALBERTO GURPEGUI RAMÓN. All rights reserved.
//

import UIKit
import FirebaseAuth
class VCRegister: UIViewController {
    
    @IBOutlet var txtfEmail:UITextField?
    @IBOutlet var txtfUsuario:UITextField?
    @IBOutlet var txtfContraseña:UITextField?
    @IBOutlet var txtfRepetirContraseña:UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func accionBotonRegistrar(){
        //self.performSegue(withIdentifier: "trregistro", sender: self)
        Auth.auth().createUser(withEmail: (txtfEmail?.text)!, password: (txtfContraseña?.text)!) { (user, error) in
            if (error==nil){
                self.performSegue(withIdentifier: "trregistro", sender: self)
            }
            else{
                print("ERROR EN REGISTRO ", error!)
            }
        }
        DataHolder.sharedInstance.firFirestoreRef = DataHolder.sharedInstance.firFirestore?.collection("Usuario").addDocument(data: [
            "Email": txtfEmail?.text,
            "Usuario": txtfUsuario?.text,
            "Contraseña": txtfContraseña?.text
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(DataHolder.sharedInstance.firFirestoreRef!.documentID)")
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
