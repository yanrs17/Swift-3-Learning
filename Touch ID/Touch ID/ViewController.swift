//
//  ViewController.swift
//  Touch ID
//
//  Created by Ryan Ruoshui Yan on 18/11/2016.
//  Copyright © 2016 Ryan Ruoshui Yan. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let authenticationContext = LAContext()
        var error: NSError?
        if authenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            authenticationContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "We need to know who you are.") {
                (success, error) in
                
                if success {
                    print("User has authenticated.")
                } else {
                    if let error = error {
                        print(error)
                    } else {
                        print("Did not authenticate.")
                    }
                }

            }
        } else {
            print("Device does not have touch id.")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

