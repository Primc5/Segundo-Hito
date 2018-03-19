//
//  ViewController.swift
//  Primer Hito
//
//  Created by ALBERTO GURPEGUI RAMÓN on 19/3/18.
//  Copyright © 2018 ALBERTO GURPEGUI RAMÓN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var btnLogear:UIButton?
    @IBOutlet var txtfUsuario:UITextField?
    @IBOutlet var txtfContraseña:UITextField?
    @IBOutlet var txtfVConsola:UITextView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func accionBotonLogear(){
        if txtfUsuario?.text=="yo" &&  txtfContraseña?.text=="12345" {
            self.performSegue(withIdentifier: "tran1", sender: self)
        }
        else{
            txtfVConsola?.text=String(format:"USUARIO: %@ CON PASSWORD: %@ NO ESTA REGISTRADO", (txtfUsuario?.text)!, (txtfContraseña?.text)!)
        }
    }
}

