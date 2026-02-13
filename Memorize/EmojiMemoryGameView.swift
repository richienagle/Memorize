//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Richard Nagle on 1/23/26.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    var viewModel: EmojiMemoryGame
    
    let emojis = ["😜","👾","👻","🕺","😈","🐶","🐵","🐓","⚽️","🍊","⭐️","🐳"]
    
    var body: some View {
        //'View' is a computed property
        //VStack(content: {List of Views})
        ScrollView {
            cards
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
        //HStack {
            //ForEach is a viewBuilder, returns view. Cant do 'for' in view
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content:emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false

    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {         //Group is a ForEach or 1
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}


#Preview {
    EmojiMemoryGameView(viewModel: <#EmojiMemoryGame#>)
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
