/*

This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike
4.0 International License, by Yong Bakos.

*/

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 211))
        label.center = CGPoint(x: view.center.x , y: view.center.y+50)
        label.text = "Programmatical Label"
        self.view.addSubview(label)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


