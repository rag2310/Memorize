//
//  ContentView.swift
//  Memorize
//
//  Created by Rodolfo Gutierrez on 25/4/24.
//

import SwiftUI

let halloweenEmojis = ["👻","🎃","🕷️","😈","💀","🕸️","🧙‍♀️","🙀","👹","😱", "☠️","🍭"]
let christmasEmojis = ["🎄","🪅","🎅","😇","🦌","☃️","❄️","🌨️","🍾","🧊", "🎇","🎁"]
let summerEmojis = ["🏖️","😎","🥵","🩳","🧳","🐟","☀️","🌊","🍖","🍤", "🍺","🎣"]

struct ContentView: View {
    
    let halloweenTheme = halloweenEmojis + halloweenEmojis
    let christmasTheme = christmasEmojis + christmasEmojis
    let summerTheme = summerEmojis + summerEmojis
    
    @State var currentEmojis = halloweenEmojis + halloweenEmojis
    
    
    @State var cardCount = 4
    
    var body: some View {
        VStack {
            title
            Spacer()
            ScrollView{
                cards
            }
            Spacer()
            changeThemes
            //cardsCountAdjusters
        }
        .padding()
    }
    
    
    var changeThemes: some View {
        HStack {
            onChangeTheme(by: halloweenTheme,icon: "🎃", content: "Hallowen")
            Spacer()
            onChangeTheme(by: christmasTheme,icon: "🎄", content: "Christmas")
            Spacer()
            onChangeTheme(by: summerTheme, icon: "🏖️",content: "Summer")
        }.padding()
    }
    
    func onChangeTheme(by list: [String],icon:String, content: String) -> some View  {
        Button(action: {
            currentEmojis = list.shuffled()
        }, label: {
            VStack{
                Text(icon)
                Text(content)
            }.font(.body)
        })
    }
    
    
    var title: some View {
            Text("Memorize").font(.largeTitle)
    }
    
    var cardsCountAdjusters: some View {
        HStack {
            cardRemove
            Spacer()
            cardAdd
            
        }.imageScale(.large).font(.largeTitle)
    }
    
    let columns = Array(repeating: GridItem(.flexible(),spacing: 10), count: 5)
    
    var cards: some View {
        LazyVGrid(columns: columns) {
            ForEach(
                0..<currentEmojis.count,
                id: \.self
            ) { index in
                CardView(
                    content: currentEmojis[index]
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
        .disabled(cardCount + offset < 1 || cardCount + offset > currentEmojis.count)
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
    @State var isFaceUp: Bool = false
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
