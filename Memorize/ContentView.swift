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
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("😜").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12)

            }
        }
    }
}


#Preview {
    ContentView()
}
