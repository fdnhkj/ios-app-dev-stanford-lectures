//
//  ViewController.swift
//  Concentration
//
//  Created by Fidan Hakaj on 17/02/2019.
//  Copyright © 2019 Fidan Hakaj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
  var flipCount = 0 {
    didSet {
      flipCountLabel.text = "Flips: \(flipCount)"
    }
  }

  @IBOutlet weak var flipCountLabel: UILabel!
  @IBOutlet var cardButtons: [UIButton]!
  
  @IBAction func touchCard(_ sender: UIButton) {
    flipCount += 1
    if let cardNumber = cardButtons.index(of: sender) {
      game.chooseCard(at: cardNumber)
      updateViewFromModel()
    } else {
      print("Chosen card was not in cardButtons")
    }
  }
  
  func updateViewFromModel() {
    for index in cardButtons.indices {
      let button = cardButtons[index]
      let card = game.cards[index]
      if card.isFaceUp {
        button.setTitle(emoji(for: card), for: .normal)
        button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
      } else {
        button.setTitle("", for: .normal)
        button.backgroundColor = card.isMatched ?  #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
      }
    }
  }

  var emojiChoices = ["🦇", "😱", "🙀", "😈", "🎃", "👻", "🍭", "🍬", "🍎"]
  var emoji = [Int:String]()
  
  func emoji(for card: Card) -> String {
    if emoji[card.identifier] == nil, emojiChoices.count > 0 {
      let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
      emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
    }
    
    return emoji[card.identifier] ?? "?"
  }
}

