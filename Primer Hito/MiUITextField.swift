//
//  MiUITextField.swift
//  Primer Hito
//
//  Created by ALBERTO GURPEGUI RAMÓN on 23/4/18.
//  Copyright © 2018 ALBERTO GURPEGUI RAMÓN. All rights reserved.
//

import UIKit

class MiUITextField: UITextField, UITextFieldDelegate {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        delegate=self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.resignFirstResponder()
        
        return false
    }
}
