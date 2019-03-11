/*

This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike
4.0 International License, by Yong Bakos.

*/

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {
    // Assignment :
    //for persisting user preferences is better to use userdefault becuse its simpler for the small amount of data that is required to store.
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var degreePicker: UIPickerView!
    private let converter = UnitConverter()
    let userDefaultLastRowKey = "defaultCelsiusPickerRow"
    @IBOutlet var temperatureRange: TemperatureRange!
    private var toFahrenheit = true
    @IBAction func switchScale(_ sender: Any) {
        toFahrenheit.toggle()
        degreePicker.reloadAllComponents()
        displayConvertedTemperatureForRow(row: degreePicker.selectedRow(inComponent: 0))
    }

    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let DegreeValue = temperatureRange.values[row]
        
       
        
     
    
        return      "\(DegreeValue) \(converter.temperatureSymbolSwitch(Fahrenheit: !toFahrenheit))" }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // convert and display temperature
      displayConvertedTemperatureForRow(row: row)
        saveSelectedRow(row: row)
      
    }
    func displayConvertedTemperatureForRow(row : Int){
        let degree = temperatureRange.values[row]
        let colorManager = ColorManager()
        if toFahrenheit{
        temperatureLabel.text = "\(converter.degreesFarenheit(degreesCelsius: degree)) \(converter.temperatureSymbolSwitch(Fahrenheit: toFahrenheit))"
        }else{
            temperatureLabel.text = "\(converter.degreesCelsius(degreeFahrenheit: degree)) \(converter.temperatureSymbolSwitch(Fahrenheit: toFahrenheit))"
            
        }
        temperatureLabel.textColor = colorManager.setColor(degree: degree)
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
        degreePicker.selectRow(row, inComponent: 0, animated: false)
        pickerView(degreePicker, didSelectRow: row, inComponent: 0)
    }
    func initialPickerRow()-> Int{
        // load from user defaults
        //if we obtained a last-row index, return it
        // otherwise, return th default
        let savedRow = UserDefaults.standard.integer(forKey: userDefaultLastRowKey) as Int?
        if let row = savedRow{
            return row
           
        }else{
        return degreePicker.numberOfRows(inComponent: 0)/2
        }}
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

