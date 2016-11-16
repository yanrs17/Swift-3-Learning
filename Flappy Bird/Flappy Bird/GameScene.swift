//
//  GameScene.swift
//  Flappy Bird
//
//  Created by Ryan Ruoshui Yan on 15/11/2016.
//  Copyright © 2016 Ryan Ruoshui Yan. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var bird = SKSpriteNode()
    var bg = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        // Like viewDidLoad()
        
        let backgroundTexture = SKTexture(imageNamed: "bg.png")
        let moveBGAnimation = SKAction.move(
            by: CGVector(
                dx: -backgroundTexture.size().width,
                dy: 0
            ),
            duration: 1 // The larger the duration, the smaller the speed
        )
        let shiftBGAnimation = SKAction.move(
            by: CGVector(
                dx: backgroundTexture.size().width,
                dy: 0),
            duration: 0 // 0: Instantly
        )
        let moveBG = SKAction.repeatForever(
            SKAction.sequence([moveBGAnimation, shiftBGAnimation]))
        var i: CGFloat = 0
        while i < 3 { // 3 layers of bg
            bg = SKSpriteNode(texture: backgroundTexture)
            bg.position = CGPoint(x: backgroundTexture.size().width * i, y: self.frame.midY)
            bg.size.height = self.frame.height
            bg.run(moveBG)
            bg.zPosition = -1 // Will always be behind the bird
            self.addChild(bg)
            i += 1
        }
        
        let birdTexture1 = SKTexture(imageNamed: "flappy1.png")
        let birdTexture2 = SKTexture(imageNamed: "flappy2.png")
        
        let animation = SKAction.animate(with: [birdTexture1, birdTexture2], timePerFrame: 0.1)
        let flap = SKAction.repeatForever(animation)
        
        bird = SKSpriteNode(texture: birdTexture1)
        bird.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        bird.run(flap)
        self.addChild(bird)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // When user touches the screen
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
