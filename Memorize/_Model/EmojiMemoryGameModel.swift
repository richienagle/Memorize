//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Rich Nagle on 3/6/25.
//
// Model

import Foundation

struct EmojiMemoryGameModel<CardContent> where CardContent: Equatable {                //<CardContent> generic type declared here, no errors
    
    private(set) var cards: Array<Card>         //allows looking, no set
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max(2,numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id:"\(pairIndex+1)a"))
            cards.append(Card(content: content, id:"\(pairIndex+1)b"))
        }
    }
    
    func choose(_ card:Card) {
        //model.choose(card)
    }
    
    mutating func shuffle() {
        cards.shuffle()
        //print(cards[0].content)
    }
    
    //func scoring {}
    
    struct Card: Equatable, Identifiable {
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
        
        var id: String
    }
}
