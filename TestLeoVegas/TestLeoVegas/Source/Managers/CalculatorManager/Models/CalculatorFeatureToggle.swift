//
//  CalculatorFeatureToggle.swift
//  TestLeoVegas
//
//  Created by Gines Sanchez Merono on 2020-07-02.
//  Copyright © 2020 Ginés Sanchez. All rights reserved.
//

import Foundation

struct CalculatorFeatureToggle {
    let add: Bool
    let subtract: Bool
    let multiply: Bool
    let divide: Bool
    let sine: Bool
    let cosine: Bool
    let bitcoinToDollar: Bool
    let mapInfo: Bool

    init(dictionary: [String: Any]? = nil) {
        self.add = dictionary?["add"] as? Bool ?? true
        self.subtract = dictionary?["subtract"] as? Bool ?? true
        self.multiply = dictionary?["multiply"] as? Bool ?? true
        self.divide = dictionary?["divide"] as? Bool ?? true
        self.sine = dictionary?["sine"] as? Bool ?? true
        self.cosine = dictionary?["cosine"] as? Bool ?? true
        self.bitcoinToDollar = dictionary?["bitcoinToDollar"] as? Bool ?? true
        self.mapInfo = dictionary?["mapInfo"] as? Bool ?? true
    }

    static func offline() -> CalculatorFeatureToggle {
        return CalculatorFeatureToggle(dictionary:
            ["add" : true,
            "subtract" : true,
            "multiply" : true,
            "divide" : true,
            "sine" : true,
            "cosine" : true,
            "bitcoinToDollar" : false,
            "mapInfo" : false])
    }
}
