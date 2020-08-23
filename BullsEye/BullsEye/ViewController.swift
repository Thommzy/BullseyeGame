//
//  ViewController.swift
//  BullsEye
//
//  Created by Tim on 22/08/2020.
//  Copyright © 2020 Tim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    var currentValue: Int =  0
    @IBOutlet weak var slider: UISlider!
    var tagretValue: Int = 0
    @IBOutlet weak var targetLabel: UILabel!
    //Instance variable
    var score = 0
    @IBOutlet weak var scoreLabel: UILabel!
    var round = 0
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //startNewRound()
        startOver()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal") //UIImage(named:  "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")  // UIImage(named:  "SliderThumb-Normal")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft") //UIImage(named: "SliderTrackLeft")
        
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal) 
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight") //UIImage(named: "SliderTrackRight")
        
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
     
    func updateLabels() {
        targetLabel.text = String(tagretValue)
    }
    
    func updateScore() {
        scoreLabel.text = String(score)
    }
    
    func updateRounds() {
        round += 1
        roundLabel.text = String(round)
    }
    
    func startNewRound() {
        tagretValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
        updateScore()
        updateRounds()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider ) {
        print("The slider value is now \(slider.value)")
    }
    
    @IBAction func startOver() {
        round = 0
        score = 0
        startNewRound()
    }
    
    @IBAction func showAlert() {
      
        //Local variable
        let difference: Int = abs(tagretValue - currentValue)
        var points: Int = 100 - difference
        score += points
        let title: String
        
        if difference == 0 {
            points += 100
            title = "Perfect!"
        }else if difference < 5 {
            title = "You almost Had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty Good!"
        } else {
            title = "Not even close... "
        }
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
         
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }

}

