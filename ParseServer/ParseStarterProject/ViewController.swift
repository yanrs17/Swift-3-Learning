/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse

class ViewController: UIViewController {
    
    var signupMode = true

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signupOrLoginButton: UIButton!
    
    @IBOutlet weak var changeModeButton: UIButton!
    @IBAction func signupOrLogin(_ sender: Any) {
    }

    @IBAction func changeMode(_ sender: Any) {
        if signupMode {
            signupOrLoginButton.titleLabel.text = "haha"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // Get/Create an object
        let user = PFObject(className: "Users")
        
        // Save a value
        user["name"] = "Ryan"
        user.saveInBackground {
            (success, error) -> Void in
            if success {
                print("Object has been saved.")
            } else {
                if error != nil {
                    print (error!)
                } else {
                    print ("Error")
                }
            }
        }
        
        // Get value with id
        let query = PFQuery(className: "Users")
        query.getObjectInBackground(withId: "ASGgI2HaeY") {
            (object, error) in
            if error != nil {
                print(error!)
            } else {
                if let user = object {
                    
                    // Get value
                    print(user)
                    print(user["name"])
                    
                    // Update value
                    // Important: Need to allow 'write' in ACL!!!
                    user["name"] = "Ruoshui"
                    user.saveInBackground(block: {
                        (success, error) in
                        if success {
                            print("Saved")
                        } else {
                            print(error!)
                        }
                    })
                    
                }
            }
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
