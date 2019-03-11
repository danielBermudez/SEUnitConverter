//
//  UnitConverter.swift
//  UnitConverter
//
//  Created by Daniel Bermudez on 3/7/19.
//  Copyright © 2019 Your School. All rights reserved.
//

import Foundation
class UnitConverter {
    func degreesFarenheit(degreesCelsius: Int)-> Int{
        return Int(1.8 * Float(degreesCelsius) + 32.0 )
        
    }
    func degreesCelsius(degreeFahrenheit : Int)-> Int{
       return Int ((Float(degreeFahrenheit)-32) * (5 / 9 ))
    }
    func temperatureSymbolSwitch(Fahrenheit: Bool)-> String{
        if Fahrenheit{
            return "°F"
        }else {
            return "°C"
        }
    }
    func distanceSymbolSwitch(miles: Bool)-> String{
        if miles{
            return "M"
        }else {
            return "KM"
        }
    }

    
}

