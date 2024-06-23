//
//  ContentView.swift
//  Memorize
//
//  Created by Rich Nagle on 6/23/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView()

        }
        .padding()
        Text("Hello World!")
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack(content: {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12).foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12).strokeBorder(lineWidth: 2)
            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        })
    }
}

#Preview {
    ContentView()
}
