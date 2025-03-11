//
//  EmojiMemorizeGame.swift
//  Memorize
//
//  Created by Rich Nagle on 3/6/25.
//
// View Model

import SwiftUI


class EmojiMemoryGameVM: ObservableObject {
    
    private static let emojis = ["👻","🎃","🎱","😈","☠️","🎾","🛟","🏖️","🌻","🤖","🚀","🏈"]
    //static allows it to be private to class, available globally
    
    private static func createMemoryGame() -> EmojiMemoryGameModel<String> {
        return EmojiMemoryGameModel(numberOfPairsOfCards: 12) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "?"
            }
            
        }
    }
    
    //var objectWillChange: ObservableObjectPublisher
    
    @Published private var model = createMemoryGame()
    
    var cards:  Array<EmojiMemoryGameModel<String>.Card> {
         return model.cards
    }
    
    //MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card:EmojiMemoryGameModel<String>.Card) {       //'_' recommended if it is an internal name
        model.choose(card)
    }
}
