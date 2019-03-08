/*

This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike
4.0 International License, by Yong Bakos.

*/

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var celsiusPicker: UIPickerView!
    private let converter = UnitConverter()
    
    @IBOutlet var temperatureRange: TemperatureRange!
    
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let celsiusValue = temperatureRange.values[row]
        
        return "\(celsiusValue)°C"    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // convert and display temperature
        let degreeCelsius = temperatureRange.values[row]
        
        temperatureLabel.text = "\(converter.degreesFarenheit(degreesCelsius: degreeCelsius))°F"
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaultPickerRow = validateDefaultTemperature()
        celsiusPicker.selectRow(defaultPickerRow, inComponent: 0, animated: false)
        pickerView(celsiusPicker, didSelectRow: defaultPickerRow, inComponent: 0)
    }
    func validateDefaultTemperature()-> Int{
        var defaultPickerRow = Int()
        
        if UserDefaults.standard.integer(forKey: "defaultDegree") != 0{
            let rowValue = UserDefaults.standard.integer(forKey: "defaultDegree")
            for i in 0 ..< celsiusPicker.numberOfRows(inComponent: 0){
                if temperatureRange!.values[i] == rowValue{
                    defaultPickerRow = i
                }
                
            }
        } else {
            defaultPickerRow = celsiusPicker.numberOfRows(inComponent: 0)/2
        }
        return defaultPickerRow
    }
    
    @IBAction func setDefaultStartingTemperature(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Change default temperature value:", message: "Please enter the new default degree to show:", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            let textField = alert.textFields![0]
            if let newDegree = textField.text{
           UserDefaults.standard.set(newDegree, forKey: "defaultDegree")
            }else{
                UserDefaults.standard.set(self.celsiusPicker.numberOfRows(inComponent: 0)/2, forKey: "defaultDegree")
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

