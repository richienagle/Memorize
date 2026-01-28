//
//  ContentView.swift
//  Memorize
//
//  Created by Richard Nagle on 1/23/26.
//

import SwiftUI

struct ContentView: View {
    
    let emojis = ["😜","👾","👻","🕺"]
    
    var body: some View {
        //'View' is a computed property
        //VStack(content: {List of Views})
        HStack {
            //ForEach is a viewBuilder, returns view. Cant do 'for' in view
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content:emojis[index] )
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false

    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}


#Preview {
    ContentView()
}
