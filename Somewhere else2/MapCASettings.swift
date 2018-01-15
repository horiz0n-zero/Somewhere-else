//
//  MapCASettings.swift
//  Somewhere else2
//
//  Created by Antoine FeuFeu on 14/01/2018.
//  Copyright © 2018 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit

struct MapCASettings {
    
    var useRandomLiveStart: Bool
    var useRandomTypeStart: Bool
    var useTurn: Bool
    
    var liveRange: UInt32
    var typeRange: UInt32
    
    var turns: Int
    var turnSurviveValue: UInt32
    
    static let zero = MapCASettings(useRandomLiveStart: false, useRandomTypeStart: false,
                                    useTurn: false, liveRange: 0, typeRange: 0, turns: 0, turnSurviveValue: 0)
}
