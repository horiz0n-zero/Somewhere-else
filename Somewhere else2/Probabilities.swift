//
//  Probabilities.swift
//  Somewhere else2
//
//  Created by Antoine FeuFeu on 15/01/2018.
//  Copyright © 2018 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit

enum Rarities: Int {
    case common = 0
    case rare = 1
    case epic = 2
    case shiny = 3
    case legendary = 4
    case extra1 = 5
    case extra2 = 6
}

struct Probabilities {
    
    static func get1() -> Rarities {
        return .common
    }
    
    static func get2() -> Rarities {
        let r = arc4random_uniform(100)
        switch r {
        case 0...70:
            return .common
        default:
            return .rare
        }
    }
    
    static func get3() -> Rarities {
        let r = arc4random_uniform(100)
        switch r {
        case 0...30:
            return .common
        case 30...90:
            return .rare
        case 90...100:
            return .epic
        default:
            return .epic
        }
    }
    
    static func get4() -> Rarities {
        let r = arc4random_uniform(100)
        switch r {
        case 0...30:
            return .common
        case 30...90:
            return .rare
        case 90...100:
            let rr = arc4random_uniform(100)
            switch rr {
            case 0...80:
                return .epic
            default:
                return .shiny
            }
        default:
            return .epic
        }
    }
    
    static func get5() -> Rarities {
        let r = arc4random_uniform(100)
        switch r {
        case 0...30:
            return .common
        case 30...90:
            return .rare
        case 90...100:
            let rr = arc4random_uniform(100)
            switch rr {
            case 0...80:
                return .epic
            case 80...95:
                return .shiny
            default:
                return .legendary
            }
        default:
            return .epic
        }
    }
    
    static func get7() -> Rarities {
        let r = arc4random_uniform(100)
        switch r {
        case 0...5:
            return .common
        case 5...10:
            return .rare
        case 10...30:
            return .epic
        case 30...50:
            return .shiny
        case 50...80:
            return .legendary
        case 80...90:
            return .extra1
        default:
            return .extra2
        }
    }
    
}
