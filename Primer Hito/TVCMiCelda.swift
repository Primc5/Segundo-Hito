//
//  TVCMiCelda.swift
//  Primer Hito
//
//  Created by ALBERTO GURPEGUI RAMÓN on 20/3/18.
//  Copyright © 2018 ALBERTO GURPEGUI RAMÓN. All rights reserved.
//

import UIKit
import FirebaseStorage

class TVCMiCelda: UITableViewCell {
    
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
        // Create a reference to the file you want to download
        let islandRef = DataHolder.sharedInstance.firStorageRef?.child(ruta)//storageRef.child(ruta)
        
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        islandRef?.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if error != nil {
                // Uh-oh, an error occurred!
            } else {
                // Data for "images/island.jpg" is returned
                let image = UIImage(data: data!)
                self.imgvPrincipal?.image = image
            }
        }
    }

}
