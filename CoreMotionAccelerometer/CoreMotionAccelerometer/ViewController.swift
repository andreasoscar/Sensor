//
//  ViewController.swift
//  CoreMotionAccelerometer
//
//  Created by Andreas Oscar Olsson on 2020-05-31.
//  Copyright © 2020 Andreas Oscar Olsson. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var xAcc: UITextField!
    @IBOutlet weak var yAcc: UITextField!
    @IBOutlet weak var zAcc: UITextField!
    var motion = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.bringSubviewToFront(xAcc)
        myAccelerometer()
    }
    
    func myAccelerometer() {
        motion.accelerometerUpdateInterval = 0.5
        motion.startAccelerometerUpdates(to: OperationQueue.current!) { (data,error) in
        print(data as Any)
        if let trueData = data {
            self.view.reloadInputViews()
            let x = trueData.acceleration.x
            let y = trueData.acceleration.y
            let z = trueData.acceleration.z
            self.xAcc.text = "x: \(Double(x).rounded(toPlaces: 3))"
            self.yAcc.text = "y: \(Double(y).rounded(toPlaces: 3))"
            self.zAcc.text = "z: \(Double(z).rounded(toPlaces: 3))"
        }
      }
    }
}

extension Double {
    func rounded(toPlaces places:Int) -> Double {
        let divisior = pow(10.0, Double(places))
        return (self * divisior).rounded() / divisior
    }
}

