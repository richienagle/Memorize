//
//  ContentView.swift
//  Memorize
//
//  Created by Richard Nagle on 1/23/26.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        //'View' is a computed property
        //VStack(content: {List of Views})
        HStack {
            CardView()
            CardView()
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
   @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("😜").font(.largeTitle)
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
