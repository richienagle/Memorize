//
//  MemorizeApp.swift
//  Memorize
//
//  Created by benjamin on 7/6/26.
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
