//
//  ContentView.swift
//  Memorize
//
//  Created by Rich Nagle on 7/6/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView(isFaceUp: false)
            CardView()
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUp = false     //creates pointer so assignment works, useful for animations
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius:12)
            //let base = Circle()
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth:2)
                Text("👻").font(.largeTitle)
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
