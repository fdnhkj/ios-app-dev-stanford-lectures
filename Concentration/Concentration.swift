//
//  Concentration.swift
//  Concentration
//
//  Created by Fidan Hakaj on 18/02/2019.
//  Copyright © 2019 Fidan Hakaj. All rights reserved.
//

import Foundation

struct Concentration {
  private(set) var cards = [Card]()

  private var indexOfOneAndOnlyFaceUpCard: Int? {
    get {
      return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
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
  
  mutating func chooseCard(at index: Int) {
    assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards")
    if !cards[index].isMatched {
      if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
        // check if cards match
        if cards[index] == cards[matchIndex] {
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

extension Collection {
  var oneAndOnly: Element? {
    return count == 1 ? first : nil
  }
}
