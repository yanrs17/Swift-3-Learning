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
    @IBOutlet var errorLabel: UILabel!
    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var signupOrLoginButton: UIButton!
    @IBOutlet var changeSignupModeButton: UIButton!
    @IBAction func signupOrLogin(_ sender: AnyObject) {
        
        if signupMode {
            let user = PFUser()
            user.username = usernameField.text
            user.password = passwordField.text
            user.signUpInBackground {
                (success, error) in
                if error != nil {
                    var errorMessage = "Signup failed - please try again"
                    let error = error as! NSError
                    if let parseError = error.userInfo["error"] as? String {
                        errorMessage = parseError
                    }
                    self.errorLabel.text = errorMessage
                } else {
                    print("Signed up")
                }
            }
        } else {
            PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!, block: {
                (user, error) in
                if error != nil {
                    var errorMessage = "Signup failed - please try again"
                    let error = error as NSError?
                    if let parseError = error?.userInfo["error"] as? String {
                        errorMessage = parseError
                    }
                    self.errorLabel.text = errorMessage
                } else {
                    print("Logged In")
                }
            })
        }
    }
    
    @IBAction func changeSignupMode(_ sender: AnyObject) {
        if signupMode {
            signupMode = false
            signupOrLoginButton.setTitle("Log In", for: [])
            changeSignupModeButton.setTitle("Sign Up", for: [])
        } else {
            signupMode = true
            signupOrLoginButton.setTitle("Sign Up", for: [])
            changeSignupModeButton.setTitle("Log In", for: [])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let testObject = PFObject(className: "TestObject2")
        testObject["foo"] = "bar"
        testObject.saveInBackground { (success, error) -> Void in
            if error != nil {
                print(error!)
            } else {
                print("Object has been saved.")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
