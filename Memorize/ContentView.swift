//
//  ContentView.swift
//  Memorize
//
//  Created by Rodolfo Gutierrez on 25/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(
                isFaceUp: true
            )
            CardView(
                isFaceUp: true
            )
            CardView(
                isFaceUp: true
            )
            CardView(
                isFaceUp: true
            )
        }
        .foregroundColor(
            .orange
        )
        .padding()
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            let base : RoundedRectangle = RoundedRectangle(
                cornerRadius: 12
            )
            if isFaceUp{
                base
                .foregroundColor(
                    .white
                )
                base
                .strokeBorder(
                    lineWidth: 2
                )
                Text(
                    "👻"
                )
                .font(
                    .largeTitle
                )
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
