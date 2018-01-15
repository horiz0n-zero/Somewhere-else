//
//  MapTileProperties.swift
//  Somewhere else2
//
//  Created by Antoine FeuFeu on 14/01/2018.
//  Copyright © 2018 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit

struct MapTileProperties {
    var live: Int
    var type: Int
    static let zero = MapTileProperties.init(live: 0, type: 0)
}
