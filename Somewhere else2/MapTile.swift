//
//  MapTile.swift
//  Somewhere else2
//
//  Created by Antoine FeuFeu on 14/01/2018.
//  Copyright © 2018 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit

class MapTile: SKSpriteNode {
    let properties: MapTileProperties
    var building: BuildingNode? = nil
    var center: CGPoint!
    
    init(data: SceneData, properties: MapTileProperties) {
        self.properties = properties
        super.init(texture: data.ile.textures[self.properties.type], color: UIColor.clear, size: data.ile.size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    func transformTo(mapLink link: MapLink, data: SceneData) {
        switch link.context {
        case .exploring, .explored:
            self.texture = data.ile.textures[6]
            self.position.y += data.ile.disize.height / 2
        default:
            break
        }
    }
    
}
