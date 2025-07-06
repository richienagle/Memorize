//
//  ContentView.swift
//  Memorize
//
//  Created by Rich Nagle on 7/6/25.
//

import SwiftUI

struct ContentView: View {
    
    let emojis = ["👻","😈","👑","🎃","🦖","🐶","🎱","🍉","☀️","🏈","🏆","🌻"]
    //let emojis: Array<String> = ["👻","😈","👑","🎃"]  //<String> to be type for generic Array
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack{
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    var cards: some View {
        LazyVGrid(columns:[GridItem(.adaptive(minimum: 120))]){
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index], isFaceUp: true)
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName:symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
        
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol:"rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol:"rectangle.stack.badge.plus.fill")
    }
    
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false     //creates pointer so assignment works, useful for animations
    
        var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius:12)
            //let base = Circle()
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth:2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            //print("tapped")
            isFaceUp.toggle()
        }
    }
    
}

#Preview {
    ContentView()
}
