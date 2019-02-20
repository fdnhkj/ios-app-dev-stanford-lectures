//
//  Concentration.swift
//  Concentration
//
//  Created by Fidan Hakaj on 18/02/2019.
//  Copyright © 2019 Fidan Hakaj. All rights reserved.
//

import Foundation

class Concentration {
  var cards = [Card]()
  var indexOfOneAndOnlyFaceUpCard: Int?

  init(numberOfPairsOfCards: Int) {
    for _ in 1...numberOfPairsOfCards {
      let card = Card()
      cards += [card, card]
    }
    
    // TODO: Shuffle the cards
  }
  
  func chooseCard(at index: Int) {
    if !cards[index].isMatched {
      if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
        // check if cards match
        if cards[index].identifier == cards[matchIndex].identifier {
          cards[index].isMatched = true
          cards[matchIndex].isMatched = true
        }
        cards[index].isFaceUp = true
        indexOfOneAndOnlyFaceUpCard = nil
      } else {
        for flipDownIndex in cards.indices {
          cards[flipDownIndex].isFaceUp = false
        }
        cards[index].isFaceUp = true
        indexOfOneAndOnlyFaceUpCard = index
      }
      
      // 1. no card are face up
      // 2. two cards face up
    }
  }
}
