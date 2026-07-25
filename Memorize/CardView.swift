//
//  CardView.swift
//  Memorize
//
//  Created by benjamin on 7/21/26.
//

import SwiftUI

struct CardView: View {
    typealias Card = MemoryGame<String>.Card

    let card: Card
    
    init(_ card: Card) {
        self.card = card
    }
    
    var body: some View {
        // real time slice up into pieces
        TimelineView(.animation(minimumInterval: 1/5)) { timeline in
        //TimelineView(.animation) { timeline in
            if card.isFaceUp || !card.isMatched {
                Pie(endAngle: .degrees(card.bonusPercentRemaining * 360))
                    .opacity(Constants.Pie.opacity)
                    .overlay(cardContents.padding(Constants.Pie.inset))
                    .padding(Constants.inset)
                    .cardify(isFaceUp: card.isFaceUp)
                    .transition(.scale) // gets infinitely small
            } else {
                Color.clear //keeps card in space, else if disappears rows shift up
            }
        }
    }
    
    var cardContents: some View {
        Text(card.content)
            .font(.system(size: Constants.FontSize.largest))
            .minimumScaleFactor(Constants.FontSize.scaleFactor)
            .multilineTextAlignment(.center)
            .aspectRatio(1, contentMode: .fit)
            .rotationEffect(.degrees(card.isMatched ? 360 : 0))
            .animation(.spin(duration: 1), value: card.isMatched)
    }
    
    private struct Constants {
        static let inset: CGFloat = 5
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
        }
        struct Pie {
            static let opacity: CGFloat = 0.5
            static let inset: CGFloat = 5
        }
    }
}

extension Animation {
    static func spin(duration: TimeInterval) -> Animation {
        .linear(duration: 1).repeatForever(autoreverses: false)
    }
}

struct CardView_Previews: PreviewProvider {
    typealias Card = CardView.Card
    
    static var previews: some View {
        VStack {
            HStack {
                CardView(Card(isFaceUp: true, content: "X", id: "test1"))
                    .aspectRatio(4/3, contentMode: .fit)
                CardView(Card(content: "X", id: "test1"))
            }
            HStack {
                CardView(Card(isFaceUp: true, isMatched: true, content: "This is a very long string and I hope it fits", id: "test1"))
                CardView(Card(isMatched: true, content: "X", id: "test1"))
            }
        }
            .padding()
            .foregroundColor(.green)
    }
}

// ORIG

//var body: some View {
//    ZStack {
//        let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
//        Group {
//            base.fill(.white)
//            base.strokeBorder(lineWidth: Constants.lineWidth)
//            Pie(endAngle: .degrees(240))
//                .opacity(Constants.Pie.opacity)
//                .overlay(
//                    Text(card.content)
//                        .font(.system(size: Constants.FontSize.largest))
//                        .minimumScaleFactor(Constants.FontSize.scaleFactor)
//                        .multilineTextAlignment(.center)
//                        .aspectRatio(1, contentMode: .fit)
//                        .padding(Constants.Pie.inset)
//            )
//            .padding(Constants.inset)
//        }
//        .opacity(card.isFaceUp ? 1 : 0)
//        base.fill().opacity(card.isFaceUp ? 0 : 1)
//    }
//    .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
