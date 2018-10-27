
//
//  ViewController.swift
//  Auto Layout Calculator(myself)
//
//  Created by Arpik Sargsyan on 9/18/18.
//  Copyright © 2018 Arpik Sargsyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    //private var isUserTypingDigit = false
    private var leftSide: Double = 0
    private var inputArray: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    private func doAction(symbol: Character, leftSide: Double, rightSide: Double) -> Double? {
        var result: Double?
        switch symbol {
        case "+":
            result = leftSide + rightSide
        case "-":
            result = leftSide - rightSide
        case "x":
            result = leftSide * rightSide
        case "/":
            result = leftSide / rightSide
        default:
            print("Something wrong")
        }
        
        return result
    }
    
    func input(_ value: Character) {
        inputArray.append(value)
    }
    
    @IBAction func touchButton(_ sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        if digit == "+" || digit == "-" || digit == "/" || digit == "x" {
                input(Character(digit))
                display.text = ""
            } else {
            
                input(Character(digit))
                if let currentText = display.text {
                    display.text = currentText + digit
                } else {
                    display.text = digit
                }
            }
        print(inputArray)
    }
    
    @IBAction func mathAction(_ sender: UIButton) {
        
        for i in inputArray {
            if i == "+" || i == "-" || i == "x" || i == "/" {
                
                let leftRange = inputArray[0...inputArray.index(of: i)! - 1]
                var leftValue = Double(String(leftRange))
                
                let rightRange = inputArray[inputArray.index(of: i)! + 1..<inputArray.count]
                let rightValue = Double(String(rightRange))
                
                let result = doAction(symbol: i, leftSide: leftValue!, rightSide:rightValue!)
                display.text = String(Double(result!))

            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

