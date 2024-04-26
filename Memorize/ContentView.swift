//
//  ContentView.swift
//  Memorize
//
//  Created by Rodolfo Gutierrez on 25/4/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻","🎃","🕷️","😈","💀","🕸️","🧙‍♀️","🙀","👹","😱", "☠️","🍭"]
    
    @State var cardCount = 4
    var body: some View {
        VStack {
            ScrollView{
                cards
            }
            Spacer()
            cardsCountAdjusters
        }
        .padding()
    }
    
    var cardsCountAdjusters: some View {
        HStack {
            cardRemove
            Spacer()
            cardAdd
            
        }.imageScale(.large).font(.largeTitle)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(
                0..<cardCount,
                id: \.self
            ) { index in
                CardView(
                    content: emojis[index]
                ).aspectRatio(2/3,contentMode: .fit)
            }
        }
        .foregroundColor(
            .orange
        )
    }
    
    func cardCountAdjuster(by offset: Int, symbol:String) -> some View {
        Button(action: {
                cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemove: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdd: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            let base : RoundedRectangle = RoundedRectangle(
                cornerRadius: 12
            )
            
            Group{
                base
                .foregroundColor(
                    .white
                )
                base
                .strokeBorder(
                    lineWidth: 2
                )
                Text(
                    content
                )
                .font(
                    .largeTitle
                )
            }.opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
            
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
