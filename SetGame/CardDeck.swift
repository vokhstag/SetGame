//
//  CardDeck.swift
//  SetGame
//
//  Created by Vokh Stag on 11/10/2019.
//  Copyright © 2019 Vokh Stag. All rights reserved.
//

import Foundation

struct CardDeck {
    
    var cards = [Card]()
    
    mutating func draw() -> Card {
        return cards.remove(at: cards.count.arc4random)
    }
    
    init () {
        for shape in Card.Variant.all {
            for color in Card.Variant.all {
                for count in Card.Variant.all {
                    for fill in Card.Variant.all {
                        let card = Card(shape: shape, color: color, count: count, fill: fill)
                        cards.append(card)
                    }
                }
            }
        }
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
