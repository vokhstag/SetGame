//
//  Card.swift
//  SetGame
//
//  Created by Vokh Stag on 11/10/2019.
//  Copyright © 2019 Vokh Stag. All rights reserved.
//

import Foundation

struct Card: Equatable {
    
    var shape: Variant
    var color: Variant
    var count: Variant
    var fill: Variant
    
    
    
    
    enum Variant: Int, Equatable {
        case first = 1
        case second
        case third
        
        static var all: [Variant] {
            return [.first, .second, .third]
        }
    }
}
