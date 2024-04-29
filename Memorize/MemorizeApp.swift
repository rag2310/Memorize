//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Rodolfo Gutierrez on 25/4/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
