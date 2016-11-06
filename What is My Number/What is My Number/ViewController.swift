//
//  ViewController.swift
//  What is My Number
//
//  Created by Ryan Ruoshui Yan on 05/11/2016.
//  Copyright © 2016 Ryan Ruoshui Yan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    @IBAction func save(_ sender: Any) {
        UserDefaults.standard.set(input.text, forKey: "phoneNumber")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let result = UserDefaults.standard.object(forKey: "phoneNumber") as? String {
            input.text = result
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

