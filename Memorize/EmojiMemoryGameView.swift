//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by benjamin on 7/6/26.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    var viewModel: EmojisMemoryGame
    
    let emojis = ["👻","😈","🤖","👽","😱","🐷","🐔","🦊","🙈","⚽️","🏈","🎾"]
    
    var body: some View {
        ScrollView(){
            cards
        }
        .padding()
        
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100, maximum: 200))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content:emojis[index], isFaceUp: true )
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    

}

struct CardView: View {
    var content: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            print("tapped")
            isFaceUp.toggle()
        }
    }
}


#Preview {
    EmojiMemoryGameView()
}

