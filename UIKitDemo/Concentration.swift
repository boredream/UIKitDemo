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
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
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
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // 其它情况
                for flipDownIndex in cards.indices {
                    // 先所有卡朝下
                    cards[flipDownIndex].isFaceUp = false
                }
                // 目标卡片朝上
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
}
