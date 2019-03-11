//
//  DistanceRange.swift
//  UnitConverter
//
//  Created by Daniel Bermudez on 3/11/19.
//  Copyright © 2019 Your School. All rights reserved.
//

import Foundation
import UIKit
class DistanceRange :NSObject, UIPickerViewDataSource{
    var values = (0 ... 500).map{$0}
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
}
}
