//
//  MapHeader.swift
//  Somewhere else2
//
//  Created by Antoine FeuFeu on 14/01/2018.
//  Copyright © 2018 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit

enum MapDrawType: Int {
    case Explore = 0
}

struct MapHeader {
    var size: Int
    let row_size: Int
    var settings: MapCASettings
    var events: MapCAEvents
    let type: MapDrawType
    let startZposition: CGFloat
    
    init(size: Int, settings: MapCASettings, events: MapCAEvents, type: MapDrawType) {
        self.size = size
        self.row_size = size * MemoryLayout<MapTileProperties>.size
        self.settings = settings
        self.events = events
        self.type = type
        self.startZposition = CGFloat(self.size)
    }
    
}
