//
//  ViewController.swift
//  Sound Shaker
//
//  Created by Ryan Ruoshui Yan on 10/11/2016.
//  Copyright © 2016 Ryan Ruoshui Yan. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEventSubtype.motionShake {
            let fileNumber = arc4random_uniform(8) + 1
            getAudio(audioName: String(fileNumber), type: "mp3")
        }
        player.play()
    }
    
    func getAudio(audioName: String, type: String) {
        let audioPath = Bundle.main.path(forResource: audioName, ofType: type)
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        } catch {
            // Process any errors
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

