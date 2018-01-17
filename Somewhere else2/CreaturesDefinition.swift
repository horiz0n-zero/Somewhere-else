//
//  CreaturesDefinition.swift
//  Somewhere else2
//
//  Created by Antoine FeuFeu on 15/01/2018.
//  Copyright © 2018 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit

struct CreaturesBaseStat {
    var type: Int
    var level: Int
    var attack: Int
    static let creatureAttack = [
        [50, 75, 120], // 0 - 1 - 2 trean
        [70, 90, 140], // tromblon
        [35, 70, 90], // troll
        [95, 110, 160], // bebe dragon
        [80, 120, 180],// sorcier
        [50, 75, 100],// helico
        [65, 120, 170] // griffon
    ]
    var attackSpeed: CGFloat
    static let creatureAttackSpeed: [CGFloat] = [
        1.5, // 0 - 1 - 2 trean
        1.4, // tromblon
        0.7, // troll
        1.0, // bebe dragon
        1.0,// sorcier
        1.0,// helico
        1.2 // griffon
    ]
    var life: Int
    static let creatureLife = [
        [250, 350, 500], // 0 - 1 - 2 trean
        [100, 150, 260], // tromblon
        [120, 160, 300], // troll
        [200, 320, 480], // bebe dragon
        [80, 120, 150],// sorcier
        [400, 550, 700],// helico
        [80, 110, 160] // griffon
    ]
    
    
    mutating func setLevel(to: Int) {
        
    }
    
    init(forCreature: CreatureType, ofRarity: Int) {
        self.level = ofRarity
        self.type = forCreature.rawValue
        self.attack = CreaturesBaseStat.creatureAttack[forCreature.rawValue][ofRarity]
        self.attackSpeed = CreaturesBaseStat.creatureAttackSpeed[forCreature.rawValue]
        self.life = CreaturesBaseStat.creatureLife[forCreature.rawValue][ofRarity]
    }
    
    init(forHero: HeroType, ofRarity: Int) {
        fatalError()
    }
    init(forSpirit: SpiritType) {
        fatalError()
    }
    init(forMonster: MonsterType, ofRarity: Int) {
        fatalError()
    }
}

enum CreaturesType: Int {
    case creature = 0
    case hero = 1
    case spirit = 2
    case monster = 3
}

enum CreatureType: Int {
    case trean = 0
    case tromblon = 1
    case troll = 2
    case babyDragon = 3
    case sorcier = 4
    case helicopter = 5
    case griffon = 6
}

enum HeroType: Int {
    case nul = 0
}

enum SpiritType: Int {
    case nul = 0
}

enum MonsterType: Int {
    case nul = 0
}
