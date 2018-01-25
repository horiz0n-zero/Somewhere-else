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
        ],
        [ // cristaux red
            SKTexture.init(imageNamed: "crisr0"),
            SKTexture.init(imageNamed: "crisr1"),
            SKTexture.init(imageNamed: "crisr2"),
            SKTexture.init(imageNamed: "crisr3"),
            SKTexture.init(imageNamed: "crisr4"),
            SKTexture.init(imageNamed: "crisr5"),
            SKTexture.init(imageNamed: "crisr6")
        ],
        [ // cristaux blue
            SKTexture.init(imageNamed: "crisb0"),
            SKTexture.init(imageNamed: "crisb1"),
            SKTexture.init(imageNamed: "crisb2"),
            SKTexture.init(imageNamed: "crisb3"),
            SKTexture.init(imageNamed: "crisb4"),
            SKTexture.init(imageNamed: "crisb5"),
            SKTexture.init(imageNamed: "crisb6")
        ]
    ]
    
    init() {
        
    }
    
}
