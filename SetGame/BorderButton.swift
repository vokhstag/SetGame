//
//  BorderButton.swift
//  SetGame
//
//  Created by Vokh Stag on 17/10/2019.
//  Copyright © 2019 Vokh Stag. All rights reserved.
//

import UIKit

class BorderButton: UIButton {

    
    func BorderIfEnabled () {
        if self.isEnabled {
            layer.borderWidth = 3.0
            layer.borderColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        } else {
            layer.borderWidth = 0.0
        }
    }
        
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
