//
//  ViewController.swift
//  Core Data
//
//  Created by Ryan Ruoshui Yan on 10/11/2016.
//  Copyright © 2016 Ryan Ruoshui Yan. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        // context is like a manager
        let context = appDelegate.persistentContainer.viewContext
//        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
//        newUser.setValue("R", forKey: "username")
//        newUser.setValue("haha", forKey: "password")
//        newUser.setValue(5, forKey: "age")
//        
//        do {
//            try context.save()
//            print("Saved.")
//        } catch {
//            print("There was an error.")
//        }
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        // Optional: Add filters
        request.predicate = NSPredicate(format: "username = %@", "R")
        
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request)
            
            if results.count > 0 {
                // NSFetchRequestResult can always be cast to NSManagedObject
                // It is persistent
                for result in results as! [NSManagedObject] {
                    if let username = result.value(forKey: "username") as? String {
                        
                        context.delete(result)
                        do {
                            try context.save()
                            print("Delete succeeded.")
                        } catch {
                            print("Delete failed.")
                        }
                        
                        print(username)
                    }
                }
            } else {
                print("No results found")
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

