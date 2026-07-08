//
//  ContentView.swift
//  Memorize
//
//  Created by benjamin on 7/6/26.
//

import SwiftUI

struct ContentView: View {
    
    let emojis = ["👻","😈","🤖","👽","😈"]

    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content:emojis[index], isFaceUp: true )
            }
        }
        .padding()
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            else {
                base.fill()
            }
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

