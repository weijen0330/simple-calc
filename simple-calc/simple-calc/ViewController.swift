//
//  ViewController.swift
//  sample-calc
//
//  Created by Wei-Jen Chiang on 4/20/16.
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
    
    @IBOutlet weak var count: UIButton!
    
    @IBOutlet weak var fact: UIButton!
    
    @IBOutlet weak var avg: UIButton!
    
    @IBOutlet weak var equal: UIButton!
    
    @IBOutlet weak var clear: UIButton!
    
    let numDict: [String : Double] = [:]
    let opArray:[String] = ["+", "-", "x", "÷", "%", "count", "avg", "fact"]
    var result: Double = 0.0
    var op: String = ""
    var avgCounter: Int = 0
    
    @IBAction func ButtonPressed(sender: UIButton) {
        let button : String = sender.titleLabel!.text!
        if (opArray.contains(button)) {
            op = button
            display.text! = button
        } else if (button == "=") {
            op = "="
            if (button == "fact") {
                if (floor(result) == result) {
                    var sum = 1;
                    for index in 1...Int(result) {
                        sum *= index
                    }
                    result = Double(sum)
                }
            }
            display.text! = String(result)
        } else if (button == "clear") {
            op = ""
            result = 0.0
            display.text! = "0.0"
        // If the user pressed a number button
        } else {
            if (opArray.contains(display.text!)) {
                display.text = button
                switch op {
                    case "+":
                        result += Double(display.text!)!
                    case "-":
                        result -= Double(display.text!)!
                    case "x":
                        result *= Double(display.text!)!
                    case "÷":
                        result /= Double(display.text!)!
                    case "%":
                        result %= Double(display.text!)!
                    case "count":
                        result += 1
                    case "avg":
                        avgCounter += 1
                        result += Double(display.text!)!
                    default:
                        result = 0.0
                }
                op = ""
            } else if (display.text! == "0.0" || op == "=") {
                op = ""
                display.text = button
                result = Double(display.text!)!
            } else {
                display.text! += button
                result = Double(display.text!)!
            }
        }
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

