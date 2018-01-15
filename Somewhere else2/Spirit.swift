//
//  Spirit.swift
//  Somewhere else2
//
//  Created by Antoine FeuFeu on 15/01/2018.
//  Copyright © 2018 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit

class SpiritNode: SKSpriteNode, Creature, Spirit {
    var type: CreaturesType
    
    init() {
        self.type = .spirit
        super.init(texture: nil, color: UIColor.clear, size: CGSize.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}

protocol Spirit {
    
}
