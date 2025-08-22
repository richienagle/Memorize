//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Rich Nagle on 7/13/25.
//  model

import Foundation

struct MemoryGame<CardContent> {
    
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        
        //cards = Array<Card>()
        cards = []
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content: CardContent =  cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(_ card: Card) {
        
    }
    
    mutating func shuffle() {     // add 'mutating' to modify model
        cards.shuffle()
        print(cards)
    }
    
    struct Card {
        var isFaceUp: Bool =  true
        var isMatched: Bool = false
        var content: CardContent
    }
    
}
