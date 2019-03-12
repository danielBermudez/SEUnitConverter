//
//  Distance.swift
//  UnitConverter
//
//  Created by Daniel Bermudez on 3/11/19.
//  Copyright © 2019 Your School. All rights reserved.
//

import UIKit
class DistanceController : UIViewController, UIPickerViewDelegate{
    
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var distancePicker: UIPickerView!
   
    @IBOutlet var distanceRange: DistanceRange!
    
    private let converter = UnitConverter()
    let userDefaultLastRowKey = "defaultDistancePickerRow"
  
    private var toMiles = true
    @IBOutlet weak var distancePciker: UIPickerView!
    @IBAction func switchScale(_ sender: Any) {
        toMiles.toggle()
        distancePicker.reloadAllComponents()
        displayConvertedDistanceForRow(row: distancePicker.selectedRow(inComponent: 0))
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let distanceValue = distanceRange.values[row]
        return "\(distanceValue) \(converter.distanceSymbolSwitch(miles: !toMiles))" }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // convert and display temperature
        displayConvertedDistanceForRow(row: row)
        saveSelectedRow(row: row)
        
    }
    func displayConvertedDistanceForRow(row : Int){
        let distance = distanceRange.values[row]
       
        if toMiles{
            
           distanceLabel.text = "\(converter.toMiles(distance: distance)) \(converter.distanceSymbolSwitch(miles: toMiles))"
        }else{
           distanceLabel.text = "\(converter.toKilometers(distance: distance)) \(converter.distanceSymbolSwitch(miles: toMiles))"
            
        }
        
    }
    func saveSelectedRow(row : Int){
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: userDefaultLastRowKey )
        defaults.synchronize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let row = initialPickerRow()
        distancePicker.selectRow(row, inComponent: 0, animated: false)
        pickerView(distancePicker, didSelectRow: row, inComponent: 0)
    }
    func initialPickerRow()-> Int{
        // load from user defaults
        //if we obtained a last-row index, return it
        // otherwise, return th default
        let savedRow = UserDefaults.standard.integer(forKey: userDefaultLastRowKey) as Int?
        if let row = savedRow{
            return row
            
        }else{
            return distancePicker.numberOfRows(inComponent: 0)/2
        }}
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



