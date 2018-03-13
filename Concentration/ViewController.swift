//
//  ViewController.swift
//  Foo
//
//  Created by Steven on 3/12/18.
//  Copyright © 2018 Steven Pray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Concentration(numberOfCardPairs: numberOfCardPairs)
    
    private var numberOfCardPairs: Int {
        return (buttons.count + 1) / 2
    }

    private var emoji = [Card:String]()

    private var emojis = "👻🎃😈🧛🏻‍♂️🔪🙀😳💀👽👺🤡🕷"

    private func emoji(for card: Card) -> Character {
        return emojis.remove(at: emojis.index(emojis.startIndex, offsetBy: emojis.count.random))
    }

    @IBOutlet private var buttons: [UIButton]!
    
    @IBOutlet private weak var flipCountLabel: UILabel! {
        didSet {
            updateView()
        }
    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
        print("touched card \(buttons.index(of: sender)!)")
        game.chooseCard(at: buttons.index(of: sender)!)
        updateView()
    }

    private func updateView() {
        flipCountLabel.text = "Flips: \(game.chooseCount)"
        for index in buttons.indices {
            if game.cards[index].isFacedUp {
                print("card is faced up \(index)")
                buttons[index].setTitle(String(emoji(for: game.cards[index])), for: .normal)
                buttons[index].backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            } else {
                buttons[index].setTitle("", for: .normal)
                buttons[index].backgroundColor = game.cards[index].isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            }
        }
    }
}

