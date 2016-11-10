//
//  ViewController.swift
//  Log In
//
//  Created by Ryan Ruoshui Yan on 10/11/2016.
//  Copyright © 2016 Ryan Ruoshui Yan. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var btnLogin: UIButton!
    @IBAction func login(_ sender: Any) {
        
        /* Init */
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        // context is like a manager
        let context = appDelegate.persistentContainer.viewContext
        
        /* Save */
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        // Save values HERE
        newUser.setValue(textField.text, forKey: "name")
        do {
            try context.save()
            textField.alpha = 0
            btnLogin.alpha = 0
            label.alpha = 1
            label.text = "Hi \(textField.text!)!"
        } catch {
            print("There was an error.")
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /* Init */
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        // context is like a manager
        let context = appDelegate.persistentContainer.viewContext
        
        /* Fetch */
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                // NSFetchRequestResult can always be cast to NSManagedObject
                // It is persistent
                // Fetch results HERE
                for result in results as! [NSManagedObject] {
                    if let username = result.value(forKey: "name") as? String {
                        textField.alpha = 0
                        btnLogin.alpha = 0
                        label.alpha = 1
                        label.text = "Hi \(username)!"
                    }
                }
            } else {
                print("No results")
            }
        } catch {
            print("Couldn't fetch results")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

