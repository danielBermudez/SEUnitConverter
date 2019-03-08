//
//  TemperatureDelegate.swift
//  UnitConverter
//
//  Created by Daniel Bermudez on 3/8/19.
//  Copyright © 2019 Your School. All rights reserved.
//

import UIKit
class temperatureDelegate : NSObject, UIPickerViewDelegate{
    let range = TemperatureRange()

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let celsiusValue = range.values[row]
        
        return "\(celsiusValue)°C"    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // convert and display temperature
        let degreeCelsius = ["degree":range.values[row]]
        NotificationCenter.default.post(name: .updateLabel, object: self, userInfo: degreeCelsius)
        
    }
}
extension Notification.Name {
    static let updateLabel  = Notification.Name("updateLabel")
    
}
