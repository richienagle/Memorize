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

    var body: some View {
        ScrollView {
            cards
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns:[GridItem(.adaptive(minimum: 85))]){
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index], isFaceUp: true)
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
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
