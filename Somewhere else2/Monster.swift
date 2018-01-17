//
//  Monster.swift
//  Somewhere else2
//
//  Created by Antoine FeuFeu on 15/01/2018.
//  Copyright © 2018 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit

class MonsterNode: SKSpriteNode, Creature, Monster {
    var type: CreaturesType
    var stat: CreaturesBaseStat
    
    init(type: MonsterType) {
        self.type = .monster
        self.stat = CreaturesBaseStat(forMonster: type, ofRarity: 0)
        super.init(texture: nil, color: UIColor.clear, size: CGSize.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}

protocol Monster {
    
}
