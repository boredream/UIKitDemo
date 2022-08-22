//
//  PlayingCard.swift
//  PlayingCard
//
//  Created by lcy on 2022/8/22.
//

struct PlayingCard: CustomStringConvertible {
    
    var description: String {
        return "\(suit)\(rank)"
    }
    
    var suit: Suit
    var rank: Rank
    
    enum Suit: String, CustomStringConvertible  {
        case spades = "黑桃"
        case hearts = "红桃"
        case diamonds = "方块"
        case clubs = "梅花"
        
        static var all = [Suit.spades, .hearts, .diamonds, .clubs]
        
        var description: String {
            return rawValue
        }
    }
    
    enum Rank: CustomStringConvertible  {
        var description: String {
            switch self {
                case .ace: return "A"
                case .numberic(let pips): return String(pips)
                case .face(let kind): return kind
            }
        }
        
        case ace
        case face(String)
        case numberic(Int)
        
        var order: Int {
            switch self {
                case .ace: return 1
                case .numberic(let pips): return pips
                case .face(let kind) where kind == "J": return 11
                case .face(let kind) where kind == "Q": return 12
                case .face(let kind) where kind == "K": return 13
                default: return 0
            }
        }
        
        static var all: [Rank] {
            var allRanks = [Rank.ace]
            for pips in 2...10 {
                allRanks.append(Rank.numberic(pips))
            }
            allRanks += [Rank.face("J"), Rank.face("Q"), Rank.face("K")]
            return allRanks
        }
        
    }
}
