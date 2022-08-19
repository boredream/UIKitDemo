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
    
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            // 如果选中卡片是未匹配的
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // 如果有已经翻起的卡片，且当前选择的不是这张卡
                if cards[matchIndex].identifier == cards[index].identifier {
                    // 翻起的卡正好是匹配的
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
}
