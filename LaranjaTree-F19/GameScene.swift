//
//  GameScene.swift
//  LaranjaTree-F19
//
//  Created by MacStudent on 2019-10-11.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var orange = SKSpriteNode()
    var ground = SKSpriteNode()
    
    var mouseXPosition:CGFloat = 0
    var mouseYPosition:CGFloat = 0
    
    var mouseStartingPositionY:CGFloat = 0
     var mouseStartingPositionX:CGFloat = 0
     var mouseEndingPositionX:CGFloat = 0
     var mouseEndingPositionY:CGFloat = 0
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        
        self.ground = self.childNode(withName: "Ground" ) as! SKSpriteNode
        

        
     
        
        
        // ADD PHYSICS TO THE GAME
        
        // Givve the orange a physics body
      
    }
    
    func spawnOrange(){
        orange = SKSpriteNode(imageNamed: "Orange")
        
        orange.position.x = mouseXPosition
        
        orange.physicsBody = SKPhysicsBody(circleOfRadius: self.orange.size.width/2)
        orange.physicsBody?.affectedByGravity = true
        
        orange.position.y = mouseYPosition
        orange.physicsBody?.restitution = 1
        
        let throwOrangeAction = SKAction.applyImpulse(CGVector(dx:5,dy:0), duration: 5)
        orange.run(throwOrangeAction)
        self.addChild(orange)
        
    }
    override func update(_ currentTime: TimeInterval) {
    
    }
    func didBegin(_ contact: SKPhysicsContact) {
        print("collision occured")
        
        let nodeA = contact.bodyA.node
        let nodeB = contact.bodyB.node
        
        if (nodeA == nil || nodeB == nil) {
            return
        }
        
        print("COLLISION DETECTED")
        print("Sprite 1: \(nodeA!.name)")
        print("Sprite 2: \(nodeB!.name)")
        print("------")
        
        
//        if (nodeA!.name == "player" && nodeB!.name == "enemy") {
//            // player die
//            print("RESETTING POSITION-AAAA")
//            restartPlayer()
//        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touched the screen")
        
        // GET THE POSITION WHERE THE MOUSE WAS CLICKED
        // ---------------------------------------------
        let mouseTouch = touches.first
        if (mouseTouch == nil) {
            return
        }
        let location = mouseTouch!.location(in: self)
        
        mouseXPosition = location.x
        mouseYPosition = location.y
        
        spawnOrange()
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let mouseTouch = touches.first
        if (mouseTouch == nil) {
            return
        }
        let location = mouseTouch!.location(in: self)
        
        mouseXPosition = location.x
        mouseYPosition = location.y
        
        
        let xDistance = mouseEndingPositionX - mouseStartingPositionX
        let yDistance = mouseEndingPositionY - mouseStartingPositionY
        spawnOrange()
    }
}
