//
//  ViewController.swift
//  SetGame
//
//  Created by Vokh Stag on 11/10/2019.
//  Copyright © 2019 Vokh Stag. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var game = Game()
    
    
    @IBOutlet var cardButtons: [CardButton]!
    
    @IBOutlet weak var deal3Button: BorderButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game.newGame()
        updateViewFromModel()
    }
    
    @IBAction func touchCard(_ sender: CardButton) {
        guard let index = cardButtons.firstIndex(of: sender) else {return}
        game.choosenCard(with: index)
        updateViewFromModel()
    }
    
    
    @IBAction func deal3More(_ sender: UIButton) {
        game.deal3moreCards()
        updateViewFromModel()
    }
    
    private func onOffDeal3Button () {
        if game.cardsOnTheTable.count == 24 && game.selectedCardsIsMatched != true {
            deal3Button.isEnabled = false
        } else {
            deal3Button.isEnabled = true
        }
        deal3Button.BorderIfEnabled()
    }
    
    private func updateViewFromModel () {
        for cardIndex in cardButtons.indices {
            let cardButton = cardButtons[cardIndex]
            if cardIndex < game.cardsOnTheTable.count {
                cardButton.isHidden = false
                let card = game.cardsOnTheTable[cardIndex]
                updateCardUI(cardButton, with: card)

            } else {
                cardButton.isHidden = true
            }
        }
        onOffDeal3Button()
    }
    private func updateCardUI(_ cardButton: CardButton, with card: Card) {
        cardButton.drawCardButton(shapeIndex: card.shape.rawValue - 1, colorIndex: card.color.rawValue - 1, count: card.count.rawValue, fillIndex: card.fill.rawValue - 1)
        if game.cardsTryMatch.firstIndex(of: card) != nil {
            if game.selectedCardsIsMatched == true {
                cardButton.matchedCardBorder()
            } else {
                cardButton.dismatchCardBodred()
            }
        } else if game.cardsSelected.firstIndex(of: card) != nil {
            cardButton.selectedCardBorder()
        }
    }
}

