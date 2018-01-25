//
//  ileData.swift
//  Somewhere else2
//
//  Created by Antoine FeuFeu on 14/01/2018.
//  Copyright © 2018 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit

struct ileData {
    
    let textures = [
        SKTexture.init(imageNamed: "ile_c0"), // 0
        SKTexture.init(imageNamed: "ile_c1"),
        SKTexture.init(imageNamed: "ile_c2"),
        SKTexture.init(imageNamed: "ile_c3"),
        SKTexture.init(imageNamed: "ile_c4"), // 4
        SKTexture.init(imageNamed: "ile_base"), // 5
        SKTexture.init(imageNamed: "ile_link"), // 6
        SKTexture.init(imageNamed: "ile_link_shadow") // 7
    ]
    let size = CGSize(width: 140, height: 207)
    let disize = CGSize(width: 69, height: 53)
}
