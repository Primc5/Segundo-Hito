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
    @IBOutlet var lblEmail:UILabel?
    @IBOutlet var imgvPrincipal: UIImageView?
    var imagenDescargada:UIImage?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func mostrarImagen(uri:String) {
        // Create a reference to the file you want to download
        self.imgvPrincipal?.image = nil
        //if imagenDescargada == nil {
            let gsReference = DataHolder.sharedInstance.firStorage?.reference(forURL: uri)
            
            // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
            gsReference?.getData(maxSize: 1 * 1024 * 1024) { data, error in
                if let error = error {
                    // Uh-oh, an error occurred!
                } else {
                    // Data for "images/island.jpg" is returned
                    //let image = UIImage(data: data!)
                    self.imagenDescargada = UIImage(data:data!)
                    self.imgvPrincipal?.image = self.imagenDescargada
                }
            }
        //}
        
    }
    /*func descargarImagen(ruta:String){
        self.imgvPrincipal?.image=nil
        DataHolder.sharedInstance.getImage(clave: ruta, getDelegate: self)
    }
    
    func dataHolderImagenDescargada(imagen: UIImage) {
        self.imgvPrincipal?.image=imagen
    }
     */
}
