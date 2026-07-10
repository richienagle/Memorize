//
//  MemorizeGame.swift
//  Memorize
//
//  Created by benjamin on 7/9/26.
//
// Model

import Foundation

struct MemoryGame<CardContent> {
    
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
    
}
