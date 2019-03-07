//
//  UnitConverter.swift
//  UnitConverter
//
//  Created by Daniel Bermudez on 3/7/19.
//  Copyright © 2019 Your School. All rights reserved.
//

import Foundation
class UnitConverter {
    var degreesCelsisus : Int?
    var  degreesFarenheit: Int?{
        if let degreeToConvert = degreesCelsisus{
        return Int(1.8 * Float(degreeToConvert) + 32.0 )
        } else
        {
            return nil
        }
    }
    
}
