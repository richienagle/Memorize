//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by benjamin on 7/6/26.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
        
    private let aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4

    var body: some View {
        VStack {
            //ScrollView(){
                cards
                .foregroundColor (viewModel.defaultColor)
                    .animation(.default, value: viewModel.cards)
            //}
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    //@ViewBuilder
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .aspectRatio(aspectRatio, contentMode: .fit)
                .padding(spacing)
                .onTapGesture {
                    viewModel.choose(card)
                }
            //   Text(card.id)
            //}
        }
        //.foregroundColor(.orange)
    }
       
}


#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}

