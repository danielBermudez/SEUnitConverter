/*

This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike
4.0 International License, by Yong Bakos.

*/

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var celsiusPicker: UIPickerView!
    private let converter = UnitConverter()
    let userDefaultLastRowKey = "defaultCelsiusPickerRow"
    @IBOutlet var temperatureRange: TemperatureRange!
    
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let celsiusValue = temperatureRange.values[row]
        
        return "\(celsiusValue)°C"    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // convert and display temperature
      displayConvertedTemperatureForRow(row: row)
        saveSelectedRow(row: row)
      
    }
    func displayConvertedTemperatureForRow(row : Int){
        let degreeCelsius = temperatureRange.values[row]
        temperatureLabel.text = "\(converter.degreesFarenheit(degreesCelsius: degreeCelsius))°F"
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
        celsiusPicker.selectRow(row, inComponent: 0, animated: false)
        pickerView(celsiusPicker, didSelectRow: row, inComponent: 0)
    }
    func initialPickerRow()-> Int{
        // load from user defaults
        //if we obtained a last-row index, return it
        // otherwise, return th default
        let savedRow = UserDefaults.standard.integer(forKey: userDefaultLastRowKey) as Int?
        if let row = savedRow{
            return row
           
        }else{
        return celsiusPicker.numberOfRows(inComponent: 0)/2
        }}
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

