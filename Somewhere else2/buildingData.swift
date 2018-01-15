//
//  buildingData.swift
//  Somewhere else2
//
//  Created by Antoine FeuFeu on 15/01/2018.
//  Copyright © 2018 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit

struct buildingData {
    
    let texture: [[SKTexture]] = [
        [ // totem 0
            SKTexture.init(imageNamed: "env_totem0"),
            SKTexture.init(imageNamed: "env_totem1"),
            SKTexture.init(imageNamed: "env_totem2")
        ],
        [ // chest 1
            SKTexture.init(imageNamed: "env_chest0"),
            SKTexture.init(imageNamed: "env_chest1"),
            SKTexture.init(imageNamed: "env_chest2")
        ]
    ]
    
    init() {
        
    }
    
}
