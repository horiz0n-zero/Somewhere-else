//
//  creatureData.swift
//  Somewhere else2
//
//  Created by Antoine FeuFeu on 15/01/2018.
//  Copyright © 2018 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit

struct CreatureProperties {
    let name: String
    var folder: String
    let level: Int
    let tex: [Int]
    var textures: [[[[SKTexture]]]]!
    
    init(name: String, folder: String, level: Int, tex: [Int]) {
        self.name = name
        self.folder = folder
        self.level = level
        self.tex = tex
        if self.level == 1 {
            self.textures = [[[[SKTexture]]]]()
            self.textures.append(creatureData.loadCreature(properties: &self))
        }
        else {
            self.textures = creatureData.loadCreatureWithLevel(properties: &self)
        }
    }
    
}

struct creatureData {
    
    let properties: [CreatureProperties] = [
        CreatureProperties(name: "trean", folder: "treedemon", level: 2, tex: [0,7,5]),
        CreatureProperties(name: "tromblon", folder: "mad", level: 2, tex: [0, 5, 5]),
        CreatureProperties(name: "troll", folder: "manh", level: 2, tex: [0, 5, 5]),
        CreatureProperties(name: "bebe dragon", folder: "fairydragon", level: 2, tex: [5, 5, 5]),
        CreatureProperties(name: "sorcier", folder: "fashi", level: 2, tex: [0, 5, 5]),
        CreatureProperties(name: "helicopter", folder: "helicopter", level: 2, tex: [5, 5, 5]),
        CreatureProperties(name: "griffon", folder: "griffin", level: 2, tex: [5, 7, 6])
    ]
    
    static func loadCreatureWithLevel(properties: inout CreatureProperties) -> [[[[SKTexture]]]] {
        
        var r = [[[[SKTexture]]]]()
        let folder = properties.folder
        
        for i in 0...properties.level {
            properties.folder = folder + "_\(i)"
            r.append(creatureData.loadCreature(properties: &properties))
        }
        properties.folder = folder
        return r
    }
    
    static func loadCreature(properties: inout CreatureProperties) -> [[[SKTexture]]] {
        
        var textures: [[[SKTexture]]] = [[[SKTexture]]]()
        var n: Int = 0
        var s: Int = 0
        
        for action in 1...3 {
            
            var action_texture = [[SKTexture]]()
            s = action * 100
            
            for directions in 0...4 {
                
                n = s + directions * 10
                let count = properties.tex[action - 1]
                var text = [SKTexture]()
                for i in 0...count {
                    let add = SKTexture(imageNamed: properties.folder + "/\(n + i).png")
                    text.append(add)
                }
                action_texture.append(text)
            }
            
            textures.append(action_texture)
        }
        return textures
    }
    
    init() {
        
    }
    
}
