//
//  Hero.swift
//  Somewhere else2
//
//  Created by Antoine FeuFeu on 15/01/2018.
//  Copyright © 2018 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit

class HeroNode: SKSpriteNode, Creature, Hero {
    
    var type: CreaturesType
    var stat: CreaturesBaseStat
    init(type: HeroType, ofRarity: Int, data: SceneData) {
        self.type = .hero
        self.stat = CreaturesBaseStat.init(forHero: type, ofRarity: ofRarity)
        super.init(texture: nil, color: UIColor.clear, size: CGSize.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}

protocol Hero {
    
}
