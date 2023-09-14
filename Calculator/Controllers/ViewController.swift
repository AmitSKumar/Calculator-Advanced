//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!

    private var isFinishTyping : Bool = true
    private  var displayValue : Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("error")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
     private  var calculatorLogic = CalculatorLogic()
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishTyping = true
        calculatorLogic.setNumber(displayValue)
        if let calcMethod = sender.currentTitle{
            print(calcMethod)
            if let result = calculatorLogic.calculator(symbol: calcMethod){
                displayValue = result
            }
           
        }
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numVal = sender.currentTitle {
            if isFinishTyping {
                displayLabel.text = numVal
                isFinishTyping = false
            } else {
                if numVal == "."{
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numVal
            }
            
        }
    
    }

}

