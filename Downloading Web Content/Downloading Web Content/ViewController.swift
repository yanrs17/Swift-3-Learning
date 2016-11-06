//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by Ryan Ruoshui Yan on 06/11/2016.
//  Copyright © 2016 Ryan Ruoshui Yan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let url = URL(string: "https://www.stackoverflow.com") {
//            webView.loadRequest(URLRequest(url: url))
//            webView.loadHTMLString("<h1>Hello There!</h1>", baseURL: nil)
            let request = NSMutableURLRequest(url: url)
            
            // It is async
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                
                if error != nil {
                    print(error!)
                } else {
                    if let unwrappedData = data {
                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                        print(dataString!)
                        
                        // Used to shorten loading time
                        DispatchQueue.main.sync(execute: {
                            
                            // Update UI
                        })
                    }
                }
                    
            }
            
            task.resume()

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

