//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Richard Nagle on 1/23/26.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
