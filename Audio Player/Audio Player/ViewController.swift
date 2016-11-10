//
//  ViewController.swift
//  Audio Player
//
//  Created by Ryan Ruoshui Yan on 09/11/2016.
//  Copyright © 2016 Ryan Ruoshui Yan. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player = AVAudioPlayer()
    
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var slider: UISlider!
    @IBAction func play(_ sender: Any) {
        if btnPlay.titleLabel?.text == "PLAY" {
            player.play()
            btnPlay.setTitle("PAUSE", for: [])
        } else {
            player.pause()
            btnPlay.setTitle("PLAY", for: [])
        }
    }
    @IBAction func moveSlider(_ sender: Any) {
        player.volume = slider.value
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
        getAudio(audioName: "sheep", type: "mp3")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

