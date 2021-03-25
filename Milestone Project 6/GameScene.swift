//
//  GameScene.swift
//  Milestone Project 6
//
//  Created by Carmen Morado on 3/22/21.
//

import SpriteKit

class GameScene: SKScene {
    var targets = [Target]()

    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "landscape")
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)
        
        for i in 0 ..< 4 { createTarget(at: CGPoint(x: 130 + (i * 250), y: 570)) }
        for i in 0 ..< 4 { createTarget(at: CGPoint(x: 130 + (i * 250), y: 400)) }
        for i in 0 ..< 4 { createTarget(at: CGPoint(x: 130 + (i * 250), y: 230)) }
    }
    
    func createTarget(at position: CGPoint) {
        let target = Target()
        target.configure(at: position)
        addChild(target)
        targets.append(target)
        target.move()
    }
        
    override func update(_ currentTime: TimeInterval) {
    }
}
