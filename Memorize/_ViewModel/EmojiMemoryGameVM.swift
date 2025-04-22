//
//  EmojiMemorizeGame.swift
//  Memorize
//
//  Created by Rich Nagle on 3/6/25.
//
// View Model

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👻","🎃","🎱","😈","☠️","🎾","🛟","🏖️","🌻","🤖","🚀","🏈"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: 11) { pairIndex in
            if emojis.indices.contains(pairIndex){
                emojis[pairIndex]
            } else {
                "⁉️"
            }
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
