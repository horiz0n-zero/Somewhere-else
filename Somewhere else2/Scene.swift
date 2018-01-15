//
//  GameScene.swift
//  Somewhere else2
//
//  Created by Antoine FeuFeu on 14/01/2018.
//  Copyright © 2018 Antoine FeuFeu. All rights reserved.
//

import SpriteKit
import UIKit
import Foundation

class Scene: SKScene {

    var data: SceneData!
    var map: Map!
    var player: Player!
    
    init(size: CGSize, data: SceneData) {
        self.data = data
        super.init(size: size)
        self.map = self.data.loadMap(named: "/home.map")
        switch self.map.header.type {
        case .Explore:
            self.drawMapExplore()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}
