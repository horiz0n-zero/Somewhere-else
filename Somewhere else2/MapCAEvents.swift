//
//  MapCAEvents.swift
//  Somewhere else2
//
//  Created by Antoine FeuFeu on 14/01/2018.
//  Copyright © 2018 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit

struct MapCAEvents {
    var requiredBuildings: Int
    var requiredLinks: Int
    var requiredItems: Int
    let requiredTotal: Int
    let range: MapCAGeneratorRange
    
    init(buildings: Int, links: Int, items: Int, range: MapCAGeneratorRange) {
        self.requiredBuildings = buildings
        self.requiredLinks = links + 1 // player entry
        self.requiredItems = items
        self.range = range
        self.requiredTotal = buildings + links + items
    }
    
    static let zero = MapCAEvents(buildings: 0, links: 0, items: 0, range: MapCAGeneratorRange.init(usingRandomPreset: true))
    
    static func randomEvents() -> MapCAEvents {
        return MapCAEvents(buildings: randomFrom(30), links: randomFrom(10), items: randomFrom(10), range: MapCAGeneratorRange.init(usingRandomPreset: true))
    }
}
