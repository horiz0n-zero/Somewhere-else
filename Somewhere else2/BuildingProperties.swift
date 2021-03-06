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
    let index: Int // BuildingType as! Int
    let raritiesGet: (() -> (Rarities))
    let yplus: [CGFloat]
    let scale: [CGFloat]
    
    init(index: Int, raritiesGet: @escaping (() -> (Rarities)), yplus: [CGFloat], scale: [CGFloat]) {
        self.index = index
        self.raritiesGet = raritiesGet
        self.yplus = yplus
        self.scale = scale
    }
    
}

enum BuildingType: Int {
    case totem = 0
    case chest = 1
    case cristalRed = 2
    case cristalBlue = 3
}

protocol BuildingProperties {
    
    var type: BuildingType { get }
    var details: BuildingDetails { get }
    var rarity: Rarities { get }
}

struct BuildingSave {
    var type: BuildingType
    var rarity: Rarities
    var x: Int
    var y: Int
    
    static let zero = BuildingSave(type: .totem, rarity: .common, x: 0, y: 0)
}
