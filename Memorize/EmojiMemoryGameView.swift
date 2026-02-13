//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Richard Nagle on 1/23/26.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
        
    var body: some View {
        //'View' is a computed property
        //VStack(content: {List of Views})
        VStack {
            ScrollView {
                cards
            }
            Button("Shuffle") {
                viewModel.shuffle() 
            }
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0 ) {
        //HStack {
            //ForEach is a viewBuilder, returns view. Cant do 'for' in view
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)     //easier to control with spacing:0 above
            }
        }
        .foregroundColor(.orange)
    }
    
}

struct CardView: View {

    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }

    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {         //Group is a ForEach or 1
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size:200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
    }
}


#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}

//@State var cardCount = 4

//var cardCountAdjusters: some View {
//    HStack {
//        cardRemover
//        Spacer()
//        cardAdder
//    }
//    .imageScale(.large)
//    .font(.largeTitle)
//}
//
//func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
//    Button(action: {
//            cardCount += offset
//    }, label: {
//        Image(systemName: symbol)
//    })
//    .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
//}
//
//
//var cardRemover: some View {
//    return cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus")
//}
//
//var cardAdder: some View {
//    return cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus")
//}
