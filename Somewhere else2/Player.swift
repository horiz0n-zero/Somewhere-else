//
//  Player.swift
//  Somewhere else2
//
//  Created by Antoine FeuFeu on 14/01/2018.
//  Copyright © 2018 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit

class Player: SKSpriteNode {
    
    var textures: [SKTexture]
    
    init(data: SceneData, type: CreatureType) {
        self.textures = data.creature.properties[type.rawValue].textures.first!.first!.first!
        super.init(texture: self.textures[0], color: UIColor.clear,
                   size: self.textures[0].size())
        self.animate()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animate() {
        self.run(SKAction.animate(with: self.textures, timePerFrame: 0.2, resize: true, restore: false), completion: {
            self.animate()
        })
    }
    
}
