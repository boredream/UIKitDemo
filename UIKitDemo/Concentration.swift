//
//  Concentration.swift
//  UIKitDemo
//
//  Created by lcy on 2022/8/19.
//

import Foundation

class Concentration {
    
    init(numberOfParisOfCards: Int) {
        for _ in 1...numberOfParisOfCards {
            let card = Card()
            cards += [card, card]
            // cards.append(card)
            // cards.append(card)
        }
    }
    
    var cards = [Card]()
    
    func chooseCard(at index: Int) {
        cards[index].isFaceUp.toggle()
    }
    
}
