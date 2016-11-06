//
//  ViewController.swift
//  Animations
//
//  Created by Ryan Ruoshui Yan on 06/11/2016.
//  Copyright © 2016 Ryan Ruoshui Yan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let initial = 0
    var cur = 0
    let max = 28
    var status = false
    
    var timer = Timer()

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var image: UIImageView!
    
    @IBAction func fadeIn(_ sender: Any) {
        
        // fade in is also used in photo-taking & screenshotting
        image.alpha = 0
        UIView.animate(withDuration: 1) {
            self.image.alpha = 1
        }
    }
    @IBAction func slideIn(_ sender: Any) {
        
        // CG = Core Graphics
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y)
        
        UIView.animate(withDuration: 2) {
            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y)
        }
    }
    @IBAction func grow(_ sender: Any) {
        
        image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        UIView.animate(withDuration: 1) {
            self.image.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        }
        // width:   image.frame.size.width
        // height:  image.frame.size.height
        
    }
    @IBAction func next(_ sender: Any) {
        
        // Use Timer() instead of while()
        if !status {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.start), userInfo: nil, repeats: true)
            status = true
            button.setTitle("Pause", for: [])
        } else {
            timer.invalidate()
            status = false
            button.setTitle("Start", for: [])
        }
        
    }
    
    func start() {
        image.image = UIImage(named: "frame_\(cur)_delay-0.01s.gif")
        cur += 1
        if cur > max {
            cur = initial
        }
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

