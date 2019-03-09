//
//  Card.swift
//  Concentration
//
//  Created by Fidan Hakaj on 18/02/2019.
//  Copyright © 2019 Fidan Hakaj. All rights reserved.
//

import Foundation

struct Card {
  var isFaceUp = false
  var isMatched = false
  var identifier:  Int
  
  private static var identifierFactory = 0
  private static func getUniqueIdentifier() -> Int {
    identifierFactory += 1
    return identifierFactory
  }
  
  init() {
    self.identifier = Card.getUniqueIdentifier()
  }
}
