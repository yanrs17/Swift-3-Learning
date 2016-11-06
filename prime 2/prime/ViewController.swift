//
//  ViewController.swift
//  prime
//
//  Created by Ryan Ruoshui Yan on 03/11/2016.
//  Copyright © 2016 Ryan Ruoshui Yan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberTextField: UITextField!
    @IBAction func prime(sender: AnyObject) {
        let number = Int(numberTextField.text!)!
        print(isPrime(number))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func isPrime(number: Int) -> Bool {
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


}

