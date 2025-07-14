//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Rich Nagle on 7/13/25.
//

import Foundation

struct MemoryGame<CardContent> {
    //CardContent generic in entire scope
    
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var contant: CardContent
    }
    
}
