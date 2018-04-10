//
//  TVCMiCelda.swift
//  Primer Hito
//
//  Created by ALBERTO GURPEGUI RAMÓN on 20/3/18.
//  Copyright © 2018 ALBERTO GURPEGUI RAMÓN. All rights reserved.
//

import UIKit
import FirebaseStorage

class TVCMiCelda: UITableViewCell,DataHolderDelegate {
    
    @IBOutlet var lblNombre:UILabel?
    @IBOutlet var imgvPrincipal: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func descargarImagen(ruta:String){
        self.imgvPrincipal?.image=nil
        DataHolder.sharedInstance.getImage(clave: ruta, getDelegate: self)
    }
    
    func dataHolderImagenDescargada(imagen: UIImage) {
        self.imgvPrincipal?.image=imagen
    }
}
