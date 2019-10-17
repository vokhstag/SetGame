//
//  Game.swift
//  SetGame
//
//  Created by Vokh Stag on 11/10/2019.
//  Copyright © 2019 Vokh Stag. All rights reserved.
//

import Foundation

struct Game {
    
    private var allCards = CardDeck()
    var cardsOnTheTable = [Card]()
    var cardsSelected = [Card]()
    var cardsMatched = [Card]()     //Уже совпавшие карты и покинувшие игру карты
    var cardsTryMatch = [Card]() {      //Карты которые сейчас совпали и еще на столе
        didSet {
            matchCheck()
        }
    }
    var selectedCardsIsMatched: Bool?
    
    mutating func matchCheck() {
        guard cardsTryMatch.count == 3 else {return}
        var shapesValue = 0
        var colorsValue = 0
        var countsValue = 0
        var fillsValue = 0
        for card in cardsTryMatch {
            shapesValue += card.shape.rawValue
            colorsValue += card.color.rawValue
            countsValue += card.count.rawValue
            fillsValue += card.fill.rawValue
        }
        if shapesValue % 3 == 0 && colorsValue % 3 == 0 && countsValue % 3 == 0 && fillsValue % 3 == 0 {
            selectedCardsIsMatched = true
        } else {
            selectedCardsIsMatched = false
        }
    }
    
    mutating func newGame() {
        allCards = CardDeck()
        for _ in 0..<Conctants.gameStartCardsCount {
            cardsOnTheTable.append(allCards.draw())
        }
        cardsSelected = []
        cardsMatched = []
        cardsTryMatch = []
    }
    
    private mutating func replaceOrRemoveCardsIfIsMatch () {
        if selectedCardsIsMatched == true {
            cardsMatched = cardsTryMatch
            for matchCard in cardsTryMatch {
                cardsOnTheTable.remove(at: (cardsOnTheTable.firstIndex(of: matchCard))!)
            }
            if cardsOnTheTable.count < Conctants.gameStartCardsCount {
                deal3moreCards()
            }
        }
    }
    
    mutating func choosenCard(with index: Int) {
        guard cardsOnTheTable.count >= index else {print("cardsOnTheTable have not value with index \(index)"); return}
        let card = cardsOnTheTable[index]
        
        if cardsSelected.count == 0 || cardsSelected.count == 1 {   //Выбрана одна или две карты
            replaceOrRemoveCardsIfIsMatch ()
            cardsTryMatch = []
            selectedCardsIsMatched = nil
            if let secondarySelectedIndex = cardsSelected.firstIndex(of: card) {
                cardsSelected.remove(at: secondarySelectedIndex)
            } else {
                cardsSelected.append(card)
            }
        } else if cardsSelected.count == 2 {
            if let secondarySelectedIndex = cardsSelected.firstIndex(of: card) {
                cardsSelected.remove(at: secondarySelectedIndex)
            } else {
                cardsSelected.append(card)
                cardsTryMatch = cardsSelected
                cardsSelected = []
            }
        }
    }
    
    mutating func deal3moreCards () {
        if selectedCardsIsMatched == true {
            cardsMatched = cardsTryMatch
            for matchCard in cardsTryMatch {
                cardsOnTheTable.remove(at: (cardsOnTheTable.firstIndex(of: matchCard))!)
            }
        }
        cardsTryMatch = []
        selectedCardsIsMatched = nil
        if allCards.cards.count >= 3 && cardsOnTheTable.count < Conctants.maxCardsCount{
            for _ in 0..<Conctants.deal3more {
                let card = allCards.draw()
                cardsOnTheTable.append(card)
            }
        }
    }
    
    
    struct Conctants {
        static let maxCardsCount = 24
        static let gameStartCardsCount = 12
        static let deal3more = 3
    }
}
