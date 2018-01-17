//
//  BuildingNode.swift
//  Somewhere else2
//
//  Created by Antoine FeuFeu on 15/01/2018.
//  Copyright © 2018 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit

class BuildingNode: SKSpriteNode, BuildingProperties {
    // protocol
    var type: BuildingType
    var details: BuildingDetails
    var rarity: Rarities
    // <--
    static let BuildingsDetails = [
        BuildingDetails.init(index: 0, raritiesGet: Probabilities.get3),
        BuildingDetails.init(index: 1, raritiesGet: Probabilities.get3)
    ]
    
    init(type: BuildingType, data: SceneData) {
        self.type = type
        self.details = BuildingNode.BuildingsDetails[self.type.rawValue]
        self.rarity = self.details.raritiesGet()
        
        super.init(texture: data.building.texture[self.type.rawValue][self.rarity.rawValue],
            color: UIColor.clear, size: data.building.texture[self.type.rawValue][self.rarity.rawValue].size())
        // todo increment decrement y position
    }
    
    init(fromSave save: BuildingSave, data: SceneData) {
        self.type = save.type
        self.details = BuildingNode.BuildingsDetails[self.type.rawValue]
        self.rarity = save.rarity
        super.init(texture: data.building.texture[self.type.rawValue][self.rarity.rawValue], color: UIColor.clear,
                   size: data.building.texture[self.type.rawValue][self.rarity.rawValue].size())
        // call a common func
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
