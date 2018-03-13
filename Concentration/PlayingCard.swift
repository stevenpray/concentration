//
//  PlayingCard.swift
//  Cards
//
//  Created by Steven on 3/13/18.
//  Copyright © 2018 Steven Pray. All rights reserved.
//

import Foundation

struct PlayingCard: CustomStringConvertible
{
    var description: String {
        return "\(rank)\(suit)"
    }

    var suit: Suit

    var rank: Rank

    enum Suit: Character, CustomStringConvertible
    {
        case spades   = "\u{2660}"
        case clubs    = "\u{2663}"
        case hearts   = "\u{2665}"
        case diamonds = "\u{2666}"

        var description: String {
            return String(rawValue)
        }

        static var all = [Suit.spades, .clubs, .hearts, .diamonds]
    }

    enum Rank: Int, CustomStringConvertible
    {
        case ace = 1
        case two = 2
        case three = 3
        case four = 11

        var description: String {
            return String(rawValue)
        }

        static var all: [Rank] {
            return [.ace, .two, .three, .four]
        }
    }

    struct Deck: CustomStringConvertible
    {
        var description: String {
            return cards.reduce("\(cards.count) Cards") { $0 + " \($1)" }
        }

        private(set) var cards: [PlayingCard] = [PlayingCard]()

        init() {
            for suit in PlayingCard.Suit.all {
                for rank in PlayingCard.Rank.all {
                    cards.append(PlayingCard(suit: suit, rank: rank))
                }
            }
        }

        mutating func shuffle() {
            cards.shuffle()
        }

        mutating func draw() -> PlayingCard? {
            return cards.count > 0 ? cards.removeFirst() : nil
        }
    }
}
