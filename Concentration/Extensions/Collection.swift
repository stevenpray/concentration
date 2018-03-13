//
//  Collection.swift
//  Concentration
//
//  Created by Steven on 3/12/18.
//  Copyright © 2018 Steven Pray. All rights reserved.
//

import Foundation

extension Collection {

    var only: Element? {
        return count == 1 ? first : nil
    }
}
