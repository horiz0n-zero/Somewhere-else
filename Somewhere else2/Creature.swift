//
//  Creature.swift
//  Somewhere else2
//
//  Created by Antoine FeuFeu on 15/01/2018.
//  Copyright © 2018 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit

class CreatureNode: SKSpriteNode, Creature {
    var type: CreaturesType
    // protocol <--
    var creatureType: CreatureType
    let textures: [[[SKTexture]]]
    let rarity: Rarities
    
    init(type: CreatureType, data: SceneData) {
        self.type = .creature
        self.creatureType = type
        self.rarity = Probabilities.get3()
        self.textures = data.creature.properties[self.creatureType.rawValue].textures[self.rarity.rawValue]
        super.init(texture: self.textures.first!.first!.first!,
                   color: UIColor.clear, size: self.textures.first!.first!.first!.size())
        self.run(SKAction.repeatForever(SKAction.animate(with: self.textures[2][0],
                                                         timePerFrame: 0.1, resize: true, restore: false)))
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}

protocol Creature {
    var type: CreaturesType { get }
}

