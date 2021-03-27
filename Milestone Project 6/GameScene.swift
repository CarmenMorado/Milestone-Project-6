//
//  GameScene.swift
//  Milestone Project 6
//
//  Created by Carmen Morado on 3/22/21.
//

import SpriteKit

class GameScene: SKScene {
    var targets = [Target]()
    var gameScore: SKLabelNode!
    
    var score = 0 {
        didSet {
            gameScore.text = "Score: \(score)"
        }
    }

    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "landscape")
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)
        
        gameScore = SKLabelNode(fontNamed: "Chalkduster")
        gameScore.text = "Score: 0"
        gameScore.position = CGPoint(x: 8, y: 8)
        gameScore.horizontalAlignmentMode = .left
        gameScore.fontSize = 48
        addChild(gameScore)
        
        for i in 0 ..< 4 { createTarget(at: CGPoint(x: 130 + (i * 250), y: 570)) }
        for i in 0 ..< 4 { createTarget(at: CGPoint(x: 130 + (i * 250), y: 400)) }
        for i in 0 ..< 4 { createTarget(at: CGPoint(x: 130 + (i * 250), y: 230)) }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let tappedNodes = nodes(at: location)
        
        for node in tappedNodes {
            guard let target = node.parent as? Target else { continue }
            if target.isHit { continue }
            target.hit()
        
            if node.name == "bird" {
                score -= 20
            }
            
            else if node.name == "FirstTarget" {
                score += 5
            }
            
            else if node.name == "SecondTarget" {
                score += 15
            }
        }
    }
    
    func createTarget(at position: CGPoint) {
        let target = Target()
        target.configure(at: position)
        addChild(target)
        targets.append(target)
        target.move()
    }
}
