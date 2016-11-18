//
//  ViewController.swift
//  Peek & Pop
//
//  Created by Ryan Ruoshui Yan on 17/11/2016.
//  Copyright © 2016 Ryan Ruoshui Yan. All rights reserved.
//

import UIKit

extension ViewController: UIViewControllerPreviewingDelegate {
    
    // Peek: Jump to peekViewController
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        let peekViewController = storyboard?.instantiateViewController(withIdentifier: "peekViewController")
        
        return peekViewController
    }
    
    // Pop: Show popViewController
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        
        let popViewController = storyboard?.instantiateViewController(withIdentifier: "popViewController")
        
        show(popViewController!, sender: self)
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if traitCollection.forceTouchCapability == UIForceTouchCapability.available {
            
            registerForPreviewing(with: self, sourceView: view)
            
        } else {
            print("Force Touch Not Available")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

