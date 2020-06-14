//
//  BillBrain.swift
//  Tipsy
//
//  Created by Christopher Klein on 13/06/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct BillBrain {
    
    var split: Int?
    var tip: Int?
    var totalPerPerson: Float?
    
    mutating func doMath(_ total: String, _ tipSelected: Int, _ splitFinal: Int) {
        
        print(total)
        print((total as NSString).floatValue)
        
        print(tipSelected)
        print(Float(tipSelected))
        
        print(splitFinal)
        
        let totalWithTip: Float = ((total as NSString).floatValue) *  (1 + Float(tipSelected) * 0.01)

        totalPerPerson = totalWithTip / Float(splitFinal)
        print(totalPerPerson)
    }
}
