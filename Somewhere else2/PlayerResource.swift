//
//  PlayerResource.swift
//  Somewhere else2
//
//  Created by Antoine FeuFeu on 15/01/2018.
//  Copyright © 2018 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit

struct PlayerResource {
    
    var gemmes: Int
    var soulStones: Int
    var coins: Int
    
    static let defaultResource = PlayerResource(gemmes: 100, soulStones: 1_000, coins: 250_000)
}
