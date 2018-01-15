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

    init() {
        self.type = .creature
        super.init(texture: nil, color: UIColor.clear, size: CGSize.zero)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}

protocol Creature {
    var type: CreaturesType { get }
}
