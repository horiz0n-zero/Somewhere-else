//
//  MapGeneratorRange.swift
//  Somewhere else2
//
//  Created by Antoine FeuFeu on 17/01/2018.
//  Copyright © 2018 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit

struct MapCAGeneratorRange {
    var buildings: [BuildingType]
    var creatures: [CreatureType]
    var heros: [HeroType]
    var spirit: [SpiritType]
    var monster: [MonsterType]
    
    
    init(buildings: [BuildingType], creatures: [CreatureType], heros: [HeroType], spirit: [SpiritType], monster: [MonsterType]) {
        self.buildings = buildings
        self.creatures = creatures
        self.heros = heros
        self.spirit = spirit
        self.monster = monster
    }
    
    static let  preset: [MapCAGeneratorRange] = [
        MapCAGeneratorRange.init(buildings: [BuildingType.chest, BuildingType.totem],
                               creatures: [CreatureType.trean, CreatureType.sorcier, CreatureType.troll, CreatureType.tromblon],
                               heros: [.nul],
                               spirit: [.nul],
                               monster: [.nul]),
        MapCAGeneratorRange.init(buildings: [BuildingType.totem],
                               creatures: [CreatureType.griffon, CreatureType.tromblon, CreatureType.babyDragon],
                               heros: [.nul],
                               spirit: [.nul],
                               monster: [.nul]),
        MapCAGeneratorRange.init(buildings: [BuildingType.chest, BuildingType.totem],
                               creatures: [CreatureType.trean, CreatureType.babyDragon, CreatureType.helicopter, CreatureType.troll],
                               heros: [.nul],
                               spirit: [.nul],
                               monster: [.nul])
    ]
    
    init(usingRandomPreset: Bool) {
        if usingRandomPreset == true {
            //self = MapCAGeneratorRange.preset[Int(arc4random_uniform(UInt32(MapCAGeneratorRange.preset.count)))]
            self = MapCAGeneratorRange(buildings: [.cristalRed, .cristalBlue, .totem, .chest], creatures: [], heros: [], spirit: [], monster: [])
        }
        else {
            self.buildings = [BuildingType]()
            self.creatures = [CreatureType]()
            self.heros = [HeroType]()
            self.spirit = [SpiritType]()
            self.monster = [MonsterType]()
        }
    }
    
}
