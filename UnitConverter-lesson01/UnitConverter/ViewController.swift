/*

This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike
4.0 International License, by Yong Bakos.

*/

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var temperatureLabel: UILabel!
    private var temperatureValues = (-100 ... 100).map{$0}
    private let converter = UnitConverter()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return temperatureValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let celsiusValue = temperatureValues[row]
        
        return "\(celsiusValue)°C"    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // convert and display temperature
        let degreeCelsius = temperatureValues[row]
        
        temperatureLabel.text = "\(converter.degreesFarenheit(degreesCelsius: degreeCelsius))°F"
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

