//
//  GameScene.swift
//  Somewhere else2
//
//  Created by Antoine FeuFeu on 14/01/2018.
//  Copyright © 2018 Antoine FeuFeu. All rights reserved.
//

import SpriteKit
import UIKit
import Foundation

class Scene: SKScene {

    var data: SceneData!
    var map: Map!
    var player: Player!
    
    init(size: CGSize, data: SceneData) {
        self.data = data
        super.init(size: size)
        self.backgroundColor = UIColor.black
        self.player = Player(texture: nil, color: UIColor.red, size: CGSize.init(width: 25, height: 25))
        self.player.position = self.data.player.map.currentPosition
        
        self.addChild(self.player)
        let cam = SKCameraNode()
        self.camera = cam
        self.addChild(cam)
        self.player.zPosition = 100
    }
    
    override func update(_ currentTime: TimeInterval) {
        self.camera?.position = self.player.position
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let t = touches.first else {
            return
        }
        self.player.position = t.location(in: self)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
