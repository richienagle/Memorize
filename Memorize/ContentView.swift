//
//  ContentView.swift
//  Memorize
//
//  Created by Rich Nagle on 7/6/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .font(.largeTitle)
        .foregroundColor(.orange)
        .padding()
    }
}

#Preview {
    ContentView()
}
