//
//  ViewController.swift
//  Spinners & Alerts
//
//  Created by Ryan Ruoshui Yan on 13/11/2016.
//  Copyright © 2016 Ryan Ruoshui Yan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activityIndicator = UIActivityIndicatorView()

    @IBAction func createAlert(_ sender: Any) {
        
        // Create alert controller
        let alertController = UIAlertController(title: "Hi There!", message: "Are you sure?", preferredStyle: UIAlertControllerStyle.alert)
        
        // Add option 1: Yes
        // Important: Order matters
        alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: {
            (action) in
            print("Yes button pressed.")
            self.dismiss(animated: true, completion: nil)
        }))
        
        // Add option 2: No
        alertController.addAction(UIAlertAction(title: "No", style: .default, handler: {
            (action) in
            print("No button pressed.")
            self.dismiss(animated: true, completion: nil)
        }))
        
        // Present alert to the user
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func pauseApp(_ sender: Any) {
        
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        // UIApplication.shared.beginIgnoringInteractionEvents()
    }
    @IBAction func restoreApp(_ sender: Any) {
        activityIndicator.stopAnimating()
        // UIApplication.shared.endIgnoringInteractionEvents()
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

