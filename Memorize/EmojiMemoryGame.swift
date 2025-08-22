//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Rich Nagle on 7/13/25.
//  View Model

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    private static let emojis = ["👻","😈","👑","🎃","🦖","🐶","🎱","🍉","☀️","🏈","🏆","🌻"]
    //'static' makes it global, but protected within class
    
    private static func createMemoryGame () -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 12) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "!?"
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
        objectWillChange.send()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
