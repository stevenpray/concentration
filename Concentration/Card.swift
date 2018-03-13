//
//  Card.swift
//  Foo
//
//  Created by Steven on 3/12/18.
//  Copyright © 2018 Steven Pray. All rights reserved.
//

import Foundation

struct Card: Hashable
{
    var isFacedUp = false
    var isMatched = false
    var hashValue = UUID().hashValue

    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}
