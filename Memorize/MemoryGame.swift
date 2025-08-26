//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Rich Nagle on 7/13/25.
//  model

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        
        //cards = Array<Card>()
        cards = []
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content: CardContent =  cardContentFactory(pairIndex)
            cards.append(Card(id: "\(pairIndex+1)a", content: content))
            cards.append(Card(id: "\(pairIndex+1)b", content: content))
        }
    }
    
    mutating func choose(_ card: Card) {
        let chosenIndex = index(of:card)
        cards[chosenIndex].isFaceUp.toggle()
        //print("chose card \(card)")
    }
    
    func index(of card: Card) -> Int {
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0  //FIXME: bogus!
    }
    
    mutating func shuffle() {     // add 'mutating' to modify model
        cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {

        var id: String
        
        /*static func == (lhs: Card, rhs: Card) -> Bool {
            return lhs.isFaceUp == rhs.isFaceUp &&
            lhs.isMatched == rhs.isMatched &&
            lhs.content == rhs.content
        }
         */
        
        var isFaceUp: Bool =  true
        var isMatched: Bool = false
        var content: CardContent
        
        var debugDescription: String {
            "\(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "M" : "U")"
        }
        
    }
    
}
