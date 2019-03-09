//
//  Concentration.swift
//  Concentration
//
//  Created by Fidan Hakaj on 18/02/2019.
//  Copyright © 2019 Fidan Hakaj. All rights reserved.
//

import Foundation

class Concentration {
  private(set) var cards = [Card]()

  private var indexOfOneAndOnlyFaceUpCard: Int? {
    get {
      var foundIndex: Int?
      for index in cards.indices {
        if cards[index].isFaceUp {
          if foundIndex == nil {
            foundIndex = index
          } else {
            return nil
          }
        }
      }
      return foundIndex
    }
    set {
      for index in cards.indices {
        cards[index].isFaceUp = (index == newValue)
      }
    }
  }

  init(numberOfPairsOfCards: Int) {
    assert(numberOfPairsOfCards > 0, "Concentration.init(numberOfPairsOfCards: \(numberOfPairsOfCards)): you must have at least one pair of cards")

    for _ in 1...numberOfPairsOfCards {
      let card = Card()
      cards += [card, card]
    }
    
    // TODO: Shuffle the cards
  }
  
  func chooseCard(at index: Int) {
    assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards")
    if !cards[index].isMatched {
      if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
        // check if cards match
        if cards[index].identifier == cards[matchIndex].identifier {
          cards[index].isMatched = true
          cards[matchIndex].isMatched = true
        }
        cards[index].isFaceUp = true
      } else {
        indexOfOneAndOnlyFaceUpCard = index
      }
      
      // 1. no card are face up
      // 2. two cards face up
    }
  }
}
