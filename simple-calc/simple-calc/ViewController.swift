//
//  ViewController.swift
//  simple-calc
//
//  Created by Wei-Jen Chiang on 4/21/16.
//  Copyright © 2016 Wei-Jen Chiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var one: UIButton!
    
    @IBOutlet weak var two: UIButton!
    
    @IBOutlet weak var three: UIButton!
    
    @IBOutlet weak var four: UIButton!
    
    @IBOutlet weak var five: UIButton!
    
    @IBOutlet weak var six: UIButton!
    
    @IBOutlet weak var seven: UIButton!
    
    @IBOutlet weak var eight: UIButton!
    
    @IBOutlet weak var nine: UIButton!
    
    @IBOutlet weak var zero: UIButton!
    
    @IBOutlet weak var display: UITextField!
    
    @IBOutlet weak var plus: UIButton!
    
    @IBOutlet weak var minus: UIButton!
    
    @IBOutlet weak var multiply: UIButton!
    
    @IBOutlet weak var divide: UIButton!
    
    @IBOutlet weak var mod: UIButton!
    
    @IBOutlet weak var count: UIButton!
    
    @IBOutlet weak var fact: UIButton!
    
    @IBOutlet weak var avg: UIButton!
    
    @IBOutlet weak var equal: UIButton!
    
    @IBOutlet weak var clear: UIButton!
    
    var opArray: [String] = ["+", "-", "x", "÷", "%", "count", "avg"]
    var result: Double! = nil
    var lastOp: String = ""
    var currNumString : String = ""
    var numCounter : Int = 0
    
    @IBAction func number (sender: UIButton) {
        let button : String = sender.titleLabel!.text!
        /* drops the result of calculation and start a new number */
        if (lastOp == "=") {
            currNumString = button
            lastOp = ""
        } else {
            currNumString += button
        }
        display.text = currNumString
    }

    @IBAction func reset(sender: UIButton) {
        result = 0.0
        lastOp = ""
        currNumString = ""
        display.text = "0.0"
        numCounter = 0
    }
    
    @IBAction func factorial(sender: UIButton) {
        /* prevents factorial on an operation */
        if (!opArray.contains(display.text!)) {
            let target : Int = Int(Double(display.text!)!)
            var sum : Int = 1
            if (target > 20) {
                display.text = "Please enter a smaller number."
            } else if (target >= 1) {
                for index in 1...target {
                    sum *= index
                }
                result = Double(sum)
                lastOp = "="
                currNumString = display.text!
                display.text = String(result)
            }
        }
    }

    @IBAction func operation(sender: UIButton) {
        /* For the first operation */
        if (lastOp == "") {
            lastOp = sender.titleLabel!.text!
            display.text = lastOp;
            result = Double(currNumString)!
            numCounter += 1
        /* pressed operation again */
        } else if (currNumString == "" && opArray.contains(lastOp)) {
            /* displays error message if user wants to calculate without a number after an operation */
            if (sender.titleLabel!.text! == "=") {
                display.text = "Please enter a number or change the operation."
            /* simply changes to a new operation */
            } else {
                lastOp = sender.titleLabel!.text!
                display.text = lastOp
            }
        } else {
            numCounter += 1
            switch lastOp {
                case "+":
                    result! += Double(currNumString)!
                case "-":
                    result! -= Double(currNumString)!
                case "x":
                    result! *= Double(currNumString)!
                case "÷":
                    result! /= Double(currNumString)!
                case "%":
                    result! %= Double(currNumString)!
                case "count":
                    result! = Double(numCounter)
                case "avg":
                    if (sender.titleLabel!.text! == "=") {
                       result = (result + Double(currNumString)!) / Double(numCounter)
                    } else {
                       result! += Double(currNumString)!
                    }
                default:
                    lastOp = sender.titleLabel!.text!
            }
            lastOp = sender.titleLabel!.text!
            /* if user wants results and pressed = */
            if (lastOp == "=") {
                display.text = String(result)
                numCounter = 0
            } else {
                display.text = lastOp
            }
        }
        currNumString = ""
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

