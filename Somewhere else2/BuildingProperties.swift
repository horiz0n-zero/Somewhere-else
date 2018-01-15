//
//  BuildingProperties.swift
//  Somewhere else2
//
//  Created by Antoine FeuFeu on 15/01/2018.
//  Copyright © 2018 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit

struct BuildingDetails {
    let index: Int
    let raritiesGet: (() -> (Rarities))
    
    init(index: Int, raritiesGet: @escaping (() -> (Rarities))) {
        self.index = index
        self.raritiesGet = raritiesGet
    }
    
}

enum BuildingType: Int {
    case totem = 0
    case chest = 1
}

protocol BuildingProperties {
    
    var type: BuildingType { get }
    var details: BuildingDetails { get }
    var rarity: Rarities { get }
}
