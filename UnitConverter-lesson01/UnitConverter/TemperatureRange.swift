//
//  TemperaturRange.swift
//  UnitConverter
//
//  Created by Daniel Bermudez on 3/7/19.
//  Copyright © 2019 Your School. All rights reserved.
//

import UIKit
class TemperatureRange :NSObject, UIPickerViewDataSource{
    
var values = (-100 ... 100).map{$0}
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func updateRange(lowerLimit: Int, upperLimit: Int){
        values =  (lowerLimit ... upperLimit).map{$0}
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
}
