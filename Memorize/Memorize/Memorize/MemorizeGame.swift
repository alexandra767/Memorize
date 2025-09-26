//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Alexandra Titus on 9/26/25.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
        
    
    }
    
}
