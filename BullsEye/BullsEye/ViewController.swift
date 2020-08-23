//
//  ViewController.swift
//  BullsEye
//
//  Created by Tim on 22/08/2020.
//  Copyright © 2020 Tim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    var currentValue: Int = 50

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sliderMoved(_ slider: UISlider ) {
        print("The slider value is now \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func showAlert() {
        //var initialValue = slider.value
        
        
        let message = "The value of the slide is \(currentValue)"
        
        let alert = UIAlertController(title: "Hello world!", message: message, preferredStyle: .alert)
         
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }

}

