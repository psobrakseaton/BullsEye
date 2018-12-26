//
//  ViewController.swift
//  BullsEye
//
//  Created by Patch Sobrak-Seaton on 12/25/18.
//  Copyright © 2018 Good Reason Co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewRound()
    }

    @IBAction func showAlert() {
        
        var difference = currentValue - targetValue
        if difference < 0 {
            difference = difference * -1
        }
        
        let message = "The value of the slider is now: \(currentValue)" + "\n The difference is: \(difference)"
        let alert = UIAlertController(title: "Hello, World", message: message, preferredStyle: .alert)
        let action = UIAlertAction (title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
 
    func updateLabels(){
        targetLabel.text = String(targetValue)
    }
}

