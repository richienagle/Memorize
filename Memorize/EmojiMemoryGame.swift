//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by benjamin on 7/9/26.
//
// ViewModel

import SwiftUI
import Combine


class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    private static let emojis = ["👻","🤖","😈","👽","😱","🐷","🐔","🦊","🙈","⚽️","🏈","🎾","🏀","🏐","🏉","🎱","🎲","🎳","🎹","🎸","🎻","🎷"]

    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 2) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "!?"
            }
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        return model.cards
    }
    
    var defaultColor: Color {
         .orange
    }
    
    // MARK: Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
}
