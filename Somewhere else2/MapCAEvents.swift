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
    
    init(buildings: Int, links: Int, items: Int) {
        self.requiredBuildings = buildings
        self.requiredLinks = links
        self.requiredItems = items
        self.requiredTotal = buildings + links + items
    }
    
    static let zero = MapCAEvents(buildings: 0, links: 0, items: 0)
}
