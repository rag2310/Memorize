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
            CardView()
            CardView(isFaceUp: true)
        }
        .foregroundColor(
            .orange
        )
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            if isFaceUp{
                RoundedRectangle(
                    cornerRadius: 12
                )
                .foregroundColor(
                    .white
                )
                RoundedRectangle(
                    cornerRadius: 12
                )
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
                RoundedRectangle(
                    cornerRadius: 12
                )
            }
        }
    }
}

#Preview {
    ContentView()
}
