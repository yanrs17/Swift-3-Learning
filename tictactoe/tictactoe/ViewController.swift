//
//  ViewController.swift
//  tictactoe
//
//  Created by Ryan Ruoshui Yan on 06/11/2016.
//  Copyright © 2016 Ryan Ruoshui Yan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var player = 0
    var steps = 0
    
    var activeGame = true
    // 0 for empty, 1 for naughts, 2 for crosses
    var states = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    @IBAction func restart(_ sender: Any) {
        viewDidLoad()
        activeGame = true
        steps = 0
        player = 0
        states = [0, 0, 0, 0, 0, 0, 0, 0, 0]

        for i in 1..<10 {
//            btn = view.viewWithTag(i) as! UIButton
            if let btn = view.viewWithTag(i) as? UIButton {
                btn.setImage(nil, for: [])
            }
        }
    }
    
    @IBOutlet weak var btnRestart: UIButton!
    @IBOutlet weak var won: UILabel!
    
    var winningCombo = [
        [0,1,2], [3,4,5], [6,7,8],
        [0,3,6], [1,4,7], [2,5,8],
        [0,4,8], [2,4,6]
    ]
    
    @IBAction func click(_ sender: AnyObject) {
        
//        print(sender.tag)
        
        if !activeGame {
            return
        }
        
        steps += 1
        var imgName: String
        let tag = Int(sender.tag) - 1
        if states[tag] == 0{
            states[tag] = player + 1
            if player == 0 {
                imgName = "nought.png"
                player = 1
            } else {
                imgName = "cross.png"
                player = 0
            }
            sender.setImage(UIImage(named: imgName), for: [])
        }
        
        for c in winningCombo {
            if (states[c[0]] != 0) {
                if (states[c[0]] == states[c[1]] && states[c[1]] == states[c[2]]) {
                    activeGame = false
                    won.isHidden = false
                    if (player == 1) {
                        won.text = "Naught has won!"
                    } else {
                        won.text = "Cross has won!"
                    }
                    btnRestart.isHidden = false
                    print(states[c[0]] - 1)
                    UIView.animate(withDuration: 1, animations: {
                        self.won.center = CGPoint(x: self.won.center.x + 500, y: self.won.center.y)
                        self.btnRestart.center = CGPoint(x: self.btnRestart.center.x + 500, y: self.btnRestart.center.y)
                    })
                    return
                }
            }
        }
        print(steps)
        if (steps == 9) {
            
            // Need to combine with above to create a fn
            activeGame = false
            won.isHidden = false
            won.text = "Tie!"
            btnRestart.isHidden = false
            UIView.animate(withDuration: 1, animations: {
                self.won.center = CGPoint(x: self.won.center.x + 500, y: self.won.center.y)
                self.btnRestart.center = CGPoint(x: self.btnRestart.center.x + 500, y: self.btnRestart.center.y)
            })

        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        won.isHidden = true
        btnRestart.isHidden = true
        won.center = CGPoint(x: won.center.x - 500, y: won.center.y)
        btnRestart.center = CGPoint(x: btnRestart.center.x - 500, y: btnRestart.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

