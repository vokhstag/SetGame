//
//  ViewController.swift
//  SetGame
//
//  Created by Vokh Stag on 11/10/2019.
//  Copyright © 2019 Vokh Stag. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var cardButtons: [CardButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardButtons[0].drawCardButton(shapeIndex: 0, colorIndex: 0, count: 1, fillIndex: 2)
        // Do any additional setup after loading the view.
    }


}

