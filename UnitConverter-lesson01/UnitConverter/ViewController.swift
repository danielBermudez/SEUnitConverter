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
        let defaultPickerRow = celsiusPicker.numberOfRows(inComponent: 0)/2
        celsiusPicker.selectRow(defaultPickerRow, inComponent: 0, animated: false)
        pickerView(celsiusPicker, didSelectRow: defaultPickerRow, inComponent: 0)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

