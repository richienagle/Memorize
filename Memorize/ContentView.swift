//
//  ContentView.swift
//  Memorize
//
//  Created by benjamin on 7/6/26.
//

import SwiftUI

struct ContentView: View {
    
    let emojis = ["👻","😈","🤖","👽","😱","🐷","🐔","🦊","🙈","⚽️","🏈","🎾"]
    @State var cardCount = 4
    
    var body: some View {
        VStack{
            ScrollView(){
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
        
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100, maximum: 200))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content:emojis[index], isFaceUp: true )
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardCountAdjusters: some View {
        HStack(){
            cardRemover
            Spacer()
            cardAdder
        }
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
                cardCount = min(max(cardCount + offset, 0), emojis.count)
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "folder.fill.badge.minus")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "folder.fill.badge.plus")
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
    ContentView()
}

