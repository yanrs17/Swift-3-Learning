//
//  ViewController.swift
//  API
//
//  Created by Ryan Ruoshui Yan on 08/11/2016.
//  Copyright © 2016 Ryan Ruoshui Yan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBAction func check(_ sender: Any) {
        
//        print(textField.text)
        if textField.text != "" {
            let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(textField.text!.replacingOccurrences(of: " ", with: "%20"))&appid=9eb6e3ef469bb840341b2bddb02bfdeb")!
            
            let task = URLSession.shared.dataTask(with: url) {
                (data, response, error) in
                
                if error != nil {
                    print(error!)
                } else {
                    if let urlData = data {
                        
                        do {
                            let jsonResult = try JSONSerialization.jsonObject(with: urlData, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                            
                            //                        print(jsonResult)
                            
                            //                        print(jsonResult["name"]!!)
                            
                            if let description = ((jsonResult["weather"] as? NSArray)?[0] as? NSDictionary)?["description"] as? String {
                                
                                // Used to shorten loading time
                                DispatchQueue.main.sync(execute: {
                                    
                                    self.result.text = description
                                })
                                
                            }
                            
                        } catch {
                            print("JSON Processing Failed.")
                        }
                    }
                }
            }
            
            task.resume()
        }
    }
    @IBOutlet weak var result: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

