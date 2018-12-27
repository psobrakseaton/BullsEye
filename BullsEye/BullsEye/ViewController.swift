//
//  ViewController.swift
//  BullsEye
//
//  Created by Patch Sobrak-Seaton on 12/25/18.
//  Copyright © 2018 Good Reason Co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var targetScore: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startOver()
    }

    @IBAction func showAlert() {
        
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        score += points
        
        let title:String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 1 {
            title = "Close, but no cigar!"
            points += 50
        } else if difference < 10 {
            title = "Not too bad"
        } else {
            title = "Not even close..."
        }
        
        let message = "You scored \(points) points!"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction (title: "OK", style: .default, handler: {
            action in
            self.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func startOver() {
        score = 0
        round = 0
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
 
    func updateLabels(){
        targetLabel.text = String(targetValue)
        targetScore.text = String(score)
        roundLabel.text = String(round)
    }
}

