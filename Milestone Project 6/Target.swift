//
//  Target.swift
//  Milestone Project 6
//
//  Created by Carmen Morado on 3/22/21.
//

import SpriteKit
import UIKit

class Target: SKNode {
    var charNode: SKSpriteNode!

    var isHit = false
    
    func configure(at position: CGPoint) {
        self.position = position
        
        if Int.random(in: 0...2) == 0 {
            charNode = SKSpriteNode(imageNamed: "FirstTarget")
            charNode.name = "FirstTarget"
        }
        
        else if Int.random(in: 0...1) == 1 {
            charNode = SKSpriteNode(imageNamed: "SecondTarget")
            charNode.name = "SecondTarget"
        }
        
        else {
            charNode = SKSpriteNode(imageNamed: "bird")
            charNode.name = "bird"
        }
       
        addChild(charNode)
    }
    
    func move() {
        let delay = SKAction.wait(forDuration: 0.35)
        let moveLeft1 = SKAction.moveBy(x: -500, y: 0, duration: 3)
        let moveLeft2 = SKAction.moveBy(x: -500, y: 0, duration: 0.5)
        let moveLeft3 = SKAction.moveBy(x: -500, y: 0, duration: 0.3)
        let moveRight1 = SKAction.moveBy(x: 500, y: 0, duration: 3)
        let moveRight2 = SKAction.moveBy(x: 500, y: 0, duration: 0.5)
        let moveRight3 = SKAction.moveBy(x: 500, y: 0, duration: 0.3)
        
        if charNode.name == "FirstTarget" {
            if position.y == 400 {
                charNode.run((SKAction.repeatForever(SKAction.sequence([delay, moveRight1, moveLeft1]))))
            }
            
            else {
                charNode.run((SKAction.repeatForever(SKAction.sequence([delay, moveLeft1, moveRight1]))))
            }
        }
        
        if charNode.name == "bird" {
            if position.y == 400 {
                charNode.run((SKAction.repeatForever(SKAction.sequence([delay, moveRight2, moveLeft2]))))
            }
            
            else {
                charNode.run((SKAction.repeatForever(SKAction.sequence([delay, moveLeft2, moveRight2]))))
            }
        }
        
        if charNode.name == "SecondTarget" {
            if position.y == 400 {
                charNode.run((SKAction.repeatForever(SKAction.sequence([delay, moveRight3, moveLeft3]))))
            }
            
            else {
                charNode.run((SKAction.repeatForever(SKAction.sequence([delay, moveLeft3, moveRight3]))))
            }
        }
    }
    
    func hit() {
        isHit = true
        
        charNode.run(SKAction.fadeAlpha(to: 0, duration: 0.5))
   }
}
