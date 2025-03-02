//
//  ContentView.swift
//  Memorize
//
//  Created by Rich Nagle on 12/27/24.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        HStack {
            CardView(content:"👻", isFaceUp: true)
            CardView(content:"👻", isFaceUp: true)
            CardView(content:"👻", isFaceUp: true)
            CardView(content:"👻", isFaceUp: true)
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    //var isFaceUp: Bool = false
    
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
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}


