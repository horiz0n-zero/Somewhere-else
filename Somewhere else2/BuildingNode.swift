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
        BuildingDetails.init(index: 0, raritiesGet: Probabilities.get3, yplus: [60, 63, 63], scale: [0.9, 0.9, 0.7]),
        BuildingDetails.init(index: 1, raritiesGet: Probabilities.get3, yplus: [63, 63, 63], scale: [0.6, 0.6, 0.6]),
        BuildingDetails.init(index: 2, raritiesGet: Probabilities.get7,
                             yplus: [60, 60, 60, 60, 60, 60, 60],
                             scale: [0.7, 0.7, 0.7, 0.7, 0.7, 0.7, 0.7]),
        BuildingDetails.init(index: 3, raritiesGet: Probabilities.get7,
                             yplus: [60, 60, 60, 60, 60, 60, 60],
                             scale: [0.7, 0.7, 0.7, 0.7, 0.7, 0.7, 0.7])
    ]
    
    fileprivate func commonInit() {
        self.position.y += self.details.yplus[self.rarity.rawValue]
        self.setScale(self.details.scale[self.rarity.rawValue])
    }
    
    init(type: BuildingType, data: SceneData) {
        self.type = type
        self.details = BuildingNode.BuildingsDetails[self.type.rawValue]
        self.rarity = self.details.raritiesGet()        
        super.init(texture: data.building.texture[self.type.rawValue][self.rarity.rawValue],
            color: UIColor.clear, size: data.building.texture[self.type.rawValue][self.rarity.rawValue].size())
        self.commonInit()
    }
    
    init(fromSave save: BuildingSave, data: SceneData) {
        self.type = save.type
        self.details = BuildingNode.BuildingsDetails[self.type.rawValue]
        self.rarity = save.rarity
        super.init(texture: data.building.texture[self.type.rawValue][self.rarity.rawValue], color: UIColor.clear,
                   size: data.building.texture[self.type.rawValue][self.rarity.rawValue].size())
        self.commonInit()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
