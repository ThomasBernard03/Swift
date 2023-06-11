//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timerProgressView: UIProgressView!
    
    
    let times : [String : Int] = [
        "Soft" : 3,
        "Medium" : 4,
        "Hard" : 7
    ]
    
    var totalTime : Int = 0
    var secondPassed : Int = 0
    
    var timer = Timer()
    
    @IBAction func eggClicked(_ sender: UIButton) {
        timerProgressView.progress = 0
        secondPassed = 0
        
        timer.invalidate()
        
        let hardness : String = sender.currentTitle! // Soft, Medium, Hard
        
        totalTime = times[hardness]!
        
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    
    @objc func updateTimer(){
        if(secondPassed < totalTime){
            secondPassed += 1
            let percentageProgress = Float(secondPassed) / Float(totalTime)
            timerProgressView.progress = percentageProgress
        }
        else {
            timer.invalidate()
        }
    }
    

}
