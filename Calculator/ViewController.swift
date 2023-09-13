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
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishTyping = true
        guard let number = Double(displayLabel.text!) else {
            fatalError("error")
        }
        if let calcMethod = sender.currentTitle{
            if calcMethod == "+/-" {
                displayLabel.text = String(number * -1)
            }
            else if  calcMethod == "AC"{
                displayLabel.text = ""
            } else if  calcMethod == "%" {
                displayLabel.text = String(number * 0.01)
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
                guard let currentDisplayVal = Double(displayLabel.text!) else {
                    fatalError("cannot covert to double")
                }
                if numVal == "."{
                    let isInt = floor(currentDisplayVal) == currentDisplayVal
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numVal
            }
            
        }
    
    }

}

