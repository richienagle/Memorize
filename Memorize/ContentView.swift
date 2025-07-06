//
//  ContentView.swift
//  Memorize
//
//  Created by Rich Nagle on 7/6/25.
//

import SwiftUI

struct ContentView: View {
    
    let emojis = ["👻","😈","👑","🎃"]
    //let emojis: Array<String> = ["👻","😈","👑","🎃"]  //<String> to be type for generic Array
    
    var body: some View {
        HStack{
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index], isFaceUp: true)
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false     //creates pointer so assignment works, useful for animations
        var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius:12)
            //let base = Circle()
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth:2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
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
