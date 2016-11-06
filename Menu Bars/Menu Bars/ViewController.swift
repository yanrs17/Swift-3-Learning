//
//  ViewController.swift
//  Menu Bars
//
//  Created by Ryan Ruoshui Yan on 03/11/2016.
//  Copyright © 2016 Ryan Ruoshui Yan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    let init_time = 210
    var cur_time = 0
    
    @IBAction func pause(_ sender: Any) {
        timer.invalidate()
    }
    @IBAction func play(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.elapse), userInfo: nil, repeats: true)
    }
    @IBAction func minus10(_ sender: Any) {
        if cur_time >= 10 {
            cur_time -= 10
        }
    }
    @IBAction func add10(_ sender: Any) {
        cur_time += 10
    }
    @IBAction func reset(_ sender: Any) {
        cur_time = init_time
    }
    
    @IBOutlet weak var countDown: UILabel!
    
    func elapse() {
        if cur_time > 0 {
            cur_time -= 1
        }
        countDown.text = String(cur_time)
    }
    
    override func viewDidLoad() {
        play(self)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cur_time = init_time
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

