//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Rich Nagle on 2/28/25.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGameVM()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
