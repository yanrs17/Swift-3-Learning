//
//  ViewController.swift
//  Downloading Images From Web
//
//  Created by Ryan Ruoshui Yan on 10/11/2016.
//  Copyright © 2016 Ryan Ruoshui Yan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // Download image from web
        if let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/6/6a/Johann_Sebastian_Bach.jpg") {
            let request = NSMutableURLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request as URLRequest) { // It is async
                data, response, error in
                
                if error != nil {
                    print(error!)
                } else {
                    if let data = data {
                        if let image = UIImage(data: data) {
                            self.imageView.image = image
                            let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
                            if documentPath.count > 0 {
                                let documentDirectory = documentPath[0]
                                let savePath = documentDirectory + "/image.jpg"
                                do {
                                    try UIImageJPEGRepresentation(image, 1)?.write(to: URL(fileURLWithPath: savePath))
                                } catch {
                                    print("Cannot save the image.")
                                }
                            }
                        }
                    }
                }
            }
            
            task.resume()
        }
        
        // Restore image downloaded
        let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        if documentPath.count > 0 {
            let documentDirectory = documentPath[0]
            let restorePath = documentDirectory + "/image.jpg"
            imageView.image = UIImage(contentsOfFile: restorePath)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

