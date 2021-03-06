//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Matthew Kennedy on 2/17/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {

    var percentage: Float
    var split: Float
    var bill: Float?
    
    func computeTip() -> Float? {
        if let bill = bill {
            return bill / split * percentage
        }
        return nil
    }
}
