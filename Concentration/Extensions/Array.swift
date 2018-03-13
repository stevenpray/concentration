//
//  Array.swift
//  Cards
//
//  Created by Steven on 3/13/18.
//  Copyright © 2018 Steven Pray. All rights reserved.
//

import Foundation

extension Array {

    public mutating func shuffle() {
        var temp = [Element]()
        while !isEmpty {
            temp.append(remove(at: count.random))
        }
        self = temp
    }
}
