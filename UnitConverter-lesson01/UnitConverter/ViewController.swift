/*

This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike
4.0 International License, by Yong Bakos.

*/

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    private let converter = UnitConverter()
    
    @IBOutlet var temperatureDelegate: temperatureDelegate!
    @IBOutlet var temperatureRange: TemperatureRange!
    
    
   @objc func updateLabel(_ notification : Notification){
    if let data = notification.userInfo as? [String:Int]{
        for (_,value) in data{
    
        temperatureLabel.text = "\(converter.degreesFarenheit(degreesCelsius: value))°F"
        }
    }
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateLabel(_:)), name: .updateLabel, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

