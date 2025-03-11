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
    
    mutating func choose(_ card:Card) {
        //print("chose \(card)")
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
    }
    
    func index(of card: Card) -> Int {
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
            
        }
        return 0    //FIXME: bogus!
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    //func scoring {}
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {

        var isFaceUp = true
        var isMatched = false
        let content: CardContent
        
        var id: String
        var debugDescription: String {
            "\(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "matched" : "")"
        }
    }
}
