//
//  VCColeccion.swift
//  Primer Hito
//
//  Created by ALBERTO GURPEGUI RAMÓN on 20/3/18.
//  Copyright © 2018 ALBERTO GURPEGUI RAMÓN. All rights reserved.
//

import UIKit

class VCColeccion: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int(DataHolder.sharedInstance.numeroCeldasColeccion);
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CVCMiCelda2 = collectionView.dequeueReusableCell(withReuseIdentifier: "micelda2", for: indexPath) as! CVCMiCelda2
        if (indexPath.row==0) {
            cell.lblNombre?.text="Alberto"
            cell.imgvMain?.image=UIImage(named: "Android.png")
        }
        else if (indexPath.row==1){
            cell.lblNombre?.text="Javi"
            cell.imgvMain?.image=UIImage(named: "Apple.png")
        }
        else if (indexPath.row==2){
            cell.lblNombre?.text="Victor"
            cell.imgvMain?.image=UIImage(named: "Android.png")
        }
        else if (indexPath.row==3){
            cell.lblNombre?.text="Nacho"
            cell.imgvMain?.image=UIImage(named: "Android.png")
        }
        else if (indexPath.row==4){
            cell.lblNombre?.text="Alvaro"
            cell.imgvMain?.image=UIImage(named: "Apple.png")
        }
        return cell;
    }
    
    
    @IBOutlet var colPrincipal:UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
