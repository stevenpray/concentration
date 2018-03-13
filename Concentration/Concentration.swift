//
//  Concentration.swift
//  Foo
//
//  Created by Steven on 3/12/18.
//  Copyright © 2018 Steven Pray. All rights reserved.
//

import Foundation

struct Concentration
{
    private(set) var cards = [Card]()

    private(set) var chooseCount = 0
    
    private var indexOfOneAndOnlyFacedupCard: Int? {
        get {
            return cards.indices.filter { cards[$0].isFacedUp }.only
        }
        set {
            for index in cards.indices {
                cards[index].isFacedUp = (index == newValue)
            }
        }
    }
    
    init(numberOfCardPairs: Int) {
        assert(numberOfCardPairs > 0)
        for _ in 1...numberOfCardPairs {
            let card = Card()
            cards += [card, card]
        }
        
        shuffleCards()
    }
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index))
        print(index)
        if !cards[index].isMatched {
            chooseCount += 1
            if let matchIndex = indexOfOneAndOnlyFacedupCard, matchIndex != index {
                if cards[matchIndex] == cards[index] {
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                }
                cards[matchIndex].isFacedUp = true
            } else {
                indexOfOneAndOnlyFacedupCard = index
            }
        }
    }

    mutating func shuffleCards() {

    }
}
