//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Thomas Bernard on 16/06/2023.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain{
    
    
    var bmi : BMI? = nil
    
    mutating func calculateBMI(height : Float, weight : Float){
        
        let bmiValue = weight / (height * height)
        var color : UIColor? = nil
        var advice : String? = nil
        
        if(bmiValue < 18.5){
            color = .blue
            advice = "Eat more pies!"
        }
        else if (bmiValue < 24.9) {
            color = .green
            advice = "Eat less pies"
        }
        else {
            color = .red
            advice = "overweight"
        }
        
        bmi = BMI(value: bmiValue, advice: advice!, color: color!)
        
    }
    
    func getBMIadvice() -> String {
        return bmi?.advice ?? ""
    }
    
    func getBMIcolor() -> UIColor {
        return bmi?.color ?? .black
    }
    
    
    func getBMIValue() -> String{
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
}
