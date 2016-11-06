//
//  ViewController.swift
//  prime
//
//  Created by Ryan Ruoshui Yan on 03/11/2016.
//  Copyright © 2016 Ryan Ruoshui Yan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /* 
     1. Know some UIs
        -> Label
        -> Button
        -> Text Field
     2. Link UIs to code using ctrl key
        -> Outlet
        -> Action
     3. Use constraints to create robust layouts
        -> Pin
            -> Upper bound to nearest neighbor
            -> Width & Height
        -> Align
            -> Horizontally in container
     4. Get text of UI
        -> UI.text
     5. Change text of UI
        -> UI.text = ...
     6. convert text of UI to int
        -> Int(UI.text!)!
     7. Do sth iff convertable
        -> if let result = Int(UI.text!) {...}
     */
    
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var result: UILabel!
    @IBAction func prime(_ sender: AnyObject) {
        if let number = Int(numberTextField.text!) {
            
            if isPrime(number) {
                result.text = "\(number) is prime."
            } else {
                result.text = "\(number) is not prime"
            }
        } else {
            result.text = "Error"
        }
        
    }
    
    func isPrime(_ number: Int) -> Bool {
        if number == 1 {
            return false
        }
        if number == 2 {
            return true
            
        }
        //    let floored = Int(floor(sqrt(Double(number))))
        for i in 2..<number {
            if number % i == 0 {
                return false
            }
        }
        return true
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

