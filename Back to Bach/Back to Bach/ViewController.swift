//
//  ViewController.swift
//  Back to Bach
//
//  Created by Ryan Ruoshui Yan on 10/11/2016.
//  Copyright © 2016 Ryan Ruoshui Yan. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    var timer = Timer()
    
    func updateScrubber() {
        scrubber.value = Float(player.currentTime)
    }
    
    @IBAction func play(_ sender: Any) {
        player.play()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateScrubber), userInfo: nil, repeats: true)
    }
    @IBAction func pause(_ sender: Any) {
        player.pause()
        timer.invalidate()
    }
    @IBAction func stop(_ sender: Any) {
        player.stop()
        timer.invalidate()
        scrubber.value = 0
        getAudio(audioName: "sheep", type: "mp3")
    }
    @IBAction func adjustVolume(_ sender: Any) {
        player.volume = volumeSlider.value
    }
    @IBOutlet weak var volumeSlider: UISlider!
    @IBAction func moveScrubber(_ sender: Any) {
        player.currentTime = TimeInterval(scrubber.value)
    }
    @IBOutlet weak var scrubber: UISlider!

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
        
        scrubber.maximumValue = Float(player.duration)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

