//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Дмитрий Емелин on 29.07.2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    func getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    func getColor() -> UIColor {
        return bmi?.color ?? .white
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5 {
            let color: UIColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
            bmi = BMI(value: bmiValue, advice: "Eat more pies", color: color)
        } else if bmiValue < 24.9 {
            let color: UIColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle", color: color )
        } else  {
            let color: UIColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            bmi = BMI(value: bmiValue, advice: "Eat less pies", color: color )
        }
        
    }
    
}
