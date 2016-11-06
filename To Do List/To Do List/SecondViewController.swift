//
//  SecondViewController.swift
//  To Do List
//
//  Created by Ryan Ruoshui Yan on 06/11/2016.
//  Copyright © 2016 Ryan Ruoshui Yan. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var itemTextField: UITextField!
    @IBAction func add(_ sender: Any) {
        
        var items: [String]
        if let tempItems = UserDefaults.standard.object(forKey: "items") as? [String] {
            items = tempItems
            items.append(itemTextField.text!)
        }
        else {
            items = [itemTextField.text!]
        }
        UserDefaults.standard.set(items, forKey: "items")
        itemTextField.text = ""
        print(UserDefaults.standard.object(forKey: "items")!)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        // Keyboard will disappear after touching outside of Text Field
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        // Keyboard will disappear after clicking on Return
        return true
    }


}

