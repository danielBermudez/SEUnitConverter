//
//  ColorManager.swift
//  UnitConverter
//
//  Created by Daniel Bermudez on 3/11/19.
//  Copyright © 2019 Your School. All rights reserved.
//

import Foundation
import UIKit
class ColorManager{
    func setColor(degree: Int)-> UIColor {
        if (degree < 0){
            return UIColor.cyan
        }else if(degree >= 0 && degree <= 20){
            return UIColor.blue
        }else if (degree > 20 && degree < 40  ) {
            return UIColor.orange
        }else{
            return UIColor.red
        }
    }
}
