//
//  ViewController.swift
//  What is the Weather
//
//  Created by Ryan Ruoshui Yan on 06/11/2016.
//  Copyright © 2016 Ryan Ruoshui Yan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var output: UILabel!
    
    var msg: String = ""
    @IBAction func submit(_ sender: Any) {
        
        let city = input.text?.lowercased()
        
        if let url = URL(string: "http://www.weather-forecast.com/locations/" + city!.replacingOccurrences(of: " ", with: "-") + "/forecasts/latest") {
            
            let request = NSMutableURLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request as URLRequest) { // It is async
                data, response, error in
                
                if error != nil {
                    print(error!)
                } else {
                    if let unwrappedData = data {
                        
                        // dataString gets all the code of the webpage
                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                        self.msg = self.extractString(whole: dataString as! String, before: "3 Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">", after: "</span></span></span></p>")
                        
                        self.msg = self.msg.replacingOccurrences(of: "&deg;", with: "°")
                        
                        // Used to shorten loading time
                        DispatchQueue.main.sync(execute: {
                            
                            // Update UI here
                            if self.msg == "" {
                            self.output.text = "No such city"
                            } else {
                            self.output.text = self.msg
                            }
                        })
                    }
                }
            }
            
            task.resume()
        }
        
    }
    
    func extractString(whole: String, before: String, after: String) -> String {
        // If there are multiple strings with value "before", select the first one.
        
        if whole == "" {
            // If empty
            return ""
        }
        var firstSplit = whole.components(separatedBy: before)
        if firstSplit.count == 1 {
            // "before" does not exist
            return ""
        }
        firstSplit.remove(at: 0)
        let firstJoint = firstSplit.joined(separator: before)
        var secondSplit = firstJoint.components(separatedBy: after)
        return secondSplit[0]
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

