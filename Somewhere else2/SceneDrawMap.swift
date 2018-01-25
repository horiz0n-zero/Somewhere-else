//
//  SceneDrawMap.swift
//  Somewhere else2
//
//  Created by Antoine FeuFeu on 14/01/2018.
//  Copyright © 2018 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit

extension Scene {
    
    func drawMapExplore() {
        var rowyposition: CGFloat = 0
        var rowxposition: CGFloat = 0
        var yposition: CGFloat = 0
        var xposition: CGFloat = 0
        let size = self.map.header.size - 2
        var z: CGFloat = 1 //CGFloat(self.map.header.size * self.map.header.size)
        
        for y in 1...size {
            for x in 1...size {
                
                if self.map.grid[y][x].live == 1 {
                    let tile = MapTile(data: self.data, properties: self.map.grid[y][x])
                
                    tile.position = CGPoint(x: xposition, y: yposition)
                    tile.center = CGPoint(x: xposition, y: yposition + self.data.ile.disize.height)
                    tile.name = "\(x * 10 + y)"
                    z = -CGFloat(x - y)
                    tile.zPosition = z
                    if let build = self.map.grid[y][x].building {
                        let buildNode = BuildingNode(fromSave: build, data: self.data)
                        tile.building = buildNode
                        tile.addChild(buildNode)
                        buildNode.zPosition = 1
                    }
                    if var link = self.map.grid[y][x].link {
                        link.x = Int(xposition)
                        link.y = Int(yposition)
                        tile.transformTo(link: link, data: self.data)
                    }
                    self.addChild(tile)
                }
                xposition += self.data.ile.disize.width
                yposition += self.data.ile.disize.height
            }
            rowyposition -= self.data.ile.disize.height
            rowxposition += self.data.ile.disize.width
            
            yposition = rowyposition
            xposition = rowxposition
        }
        
    }
    
}
