//
//  Int.swift
//  Concentration
//
//  Created by Steven on 3/12/18.
//  Copyright © 2018 Steven Pray. All rights reserved.
//

import Foundation

extension Int {

    var random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
