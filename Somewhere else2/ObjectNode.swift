//
//  ObjectNode.swift
//  Somewhere else2
//
//  Created by Antoine FeuFeu on 15/01/2018.
//  Copyright © 2018 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit

enum ObjectType: Int {
    case bag = 0
    case resource = 1
}

class ObjectNode: SKSpriteNode {
    let type: ObjectType
    static let typeOfItem = [
        ObjectType.resource,
        ObjectType.bag,
        ObjectType.bag,
        ObjectType.bag
    ]
    let item: Item
    
    init(type: ItemType) {
        self.item = Item(type: type)
        self.type = ObjectNode.typeOfItem[type.rawValue]
        super.init(texture: self.item.propertie.textures[self.item.rarity.rawValue],
            color: UIColor.clear, size: self.item.propertie.textures[self.item.rarity.rawValue].size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

