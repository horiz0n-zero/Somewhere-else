//
//  Item.swift
//  Somewhere else2
//
//  Created by Antoine FeuFeu on 15/01/2018.
//  Copyright © 2018 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit

enum ItemType: Int {
    case soulStone = 0
    case gemmes = 1
    case powerstone = 2
    case books = 3
}

struct ItemProperties {
    let textures: [SKTexture]
    let getRarity: (() -> Rarities)
}

struct MapItem {
    let rarity: Rarities
    let type: ItemType
    static let zero = MapItem(rarity: .common, type: ItemType.gemmes)
}
extension Item {
    func getMapItem() -> MapItem {
        return MapItem(rarity: self.rarity, type: self.type)
    }
}

struct Item {
    let propertie: ItemProperties
    let rarity: Rarities
    let type: ItemType
    
    static let properties = [
        ItemProperties(textures:
            [SKTexture.init(imageNamed: "soulstone")],
                       getRarity: Probabilities.get1),
        ItemProperties(textures:
            [SKTexture.init(imageNamed: "gem_1"),
             SKTexture.init(imageNamed: "gem_2"),
             SKTexture.init(imageNamed: "gem_3"),
             SKTexture.init(imageNamed: "gem_4"),
             SKTexture.init(imageNamed: "gem_5")], getRarity: Probabilities.get5),
        ItemProperties(textures:
            [SKTexture.init(imageNamed: "env_powerstone1"),
             SKTexture.init(imageNamed: "env_powerstone2"),
             SKTexture.init(imageNamed: "env_powerstone3")], getRarity: Probabilities.get3),
        ItemProperties(textures:
            [SKTexture.init(imageNamed: "book1"),
             SKTexture.init(imageNamed: "book2"),
             SKTexture.init(imageNamed: "book3"),
             SKTexture.init(imageNamed: "book4"),
             SKTexture.init(imageNamed: "book5")], getRarity: Probabilities.get5)
    ]
    
    init(type: ItemType) {
        self.type = type
        self.propertie = Item.properties[type.rawValue]
        self.rarity = self.propertie.getRarity()
    }
}
