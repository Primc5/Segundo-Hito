//
//  VCPrincipal.swift
//  Primer Hito
//
//  Created by ALBERTO GURPEGUI RAMÓN on 19/3/18.
//  Copyright © 2018 ALBERTO GURPEGUI RAMÓN. All rights reserved.
//

import UIKit

class VCPrincipal: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tbMiTable:UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TVCMiCelda = tableView.dequeueReusableCell(withIdentifier: "micelda1") as! TVCMiCelda
        //cell.lblNombre?.text="Yony"
        if (indexPath.row==0) {
            cell.lblNombre?.text="Alberto"
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
        }
        return cell
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
