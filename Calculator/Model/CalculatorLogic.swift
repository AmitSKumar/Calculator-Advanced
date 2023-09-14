//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by user243065 on 9/14/23.
//  Copyright © 2023 London App Brewery. All rights reserved.
//

import Foundation
struct CalculatorLogic {
    private var number : Double?
    private var intermediateCaculation : (n1 : Double ,calcMethod : String )?
    mutating func setNumber(_ number: Double){
        self.number = number
        
    }
    mutating func calculator(symbol : String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-" :
                return n * -1
            case "AC":
            return 0
            case "%":
            return n  * 0.01
            case "=":
            return performTwoNumberCalcultion(n2 : n)
            default :
            intermediateCaculation = (n1: n , calcMethod : symbol)
          }   
        }
            return nil
    }
   private func  performTwoNumberCalcultion(n2 : Double) -> Double? {
       if let n1 = intermediateCaculation?.n1 ,let operation = intermediateCaculation?.calcMethod {
           switch operation {
           case "+" :
               return n1 + n2
           case "-" :
               return n1 - n2

           case "×" :
               return n1 * n2

           case "÷" :
               return n1 / n2
           default :
               fatalError("Operation passed doesnot math ")
           }
       }
       return nil
    }
}
