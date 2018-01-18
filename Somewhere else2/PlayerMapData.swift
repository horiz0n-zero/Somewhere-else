//
//  PlayerMapData.swift
//  Somewhere else2
//
//  Created by Antoine FeuFeu on 17/01/2018.
//  Copyright © 2018 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit

struct PlayerMapData {
    var currentMapPath: String
    var currentMapRange: MapCAGeneratorRange
    var currentPosition: CGPoint
    
    static let zero = PlayerMapData(currentMapPath: "/home.map",
                                    currentMapRange: MapCAGeneratorRange.init(usingRandomPreset: true),
                                    currentPosition: CGPoint.zero)
}
