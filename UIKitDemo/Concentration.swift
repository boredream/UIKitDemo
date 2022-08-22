//
//  Concentration.swift
//  UIKitDemo
//
//  Created by lcy on 2022/8/19.
//

import Foundation

struct Concentration {
    
    init(numberOfParisOfCards: Int) {
        assert(numberOfParisOfCards > 0, "Concentration.init(\(numberOfParisOfCards)): you must have at least one pair")
        for _ in 0..<numberOfParisOfCards {
            let card = Card()
            cards += [card, card]
            // cards.append(card)
            // cards.append(card)
        }
    }
    
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched {
            // 如果选中卡片是未匹配的
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // 如果有已经翻起的卡片，且当前选择的不是这张卡
                if cards[matchIndex] == cards[index] {
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

extension Collection {
    // Element对应泛型的那个类型
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
