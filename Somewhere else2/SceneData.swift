//
//  SceneData.swift
//  Somewhere else2
//
//  Created by Antoine FeuFeu on 14/01/2018.
//  Copyright © 2018 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit

struct SceneData {
    let ile = ileData()
    let building = buildingData()
    let creature = creatureData()
    var controller: GameViewController? = nil
    let documents: String!
    let documents_maps: String!
    let documents_player_resource: String!
    var current_map: String!
    var player: PlayerData!
    
    init() {
        self.documents = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).path
        self.documents_maps = self.documents.appending("/maps")
        self.documents_player_resource = self.documents.appending("/player.player_resource")
        
        if FileManager.default.fileExists(atPath: self.documents_maps) == false {
            try! FileManager.default.createDirectory(atPath: self.documents_maps, withIntermediateDirectories: true, attributes: nil)
        }
        
        if FileManager.default.fileExists(atPath: self.documents_player_resource) == false {
            FileManager.default.createFile(atPath: self.documents_player_resource, contents: nil, attributes: nil)
            
            var playerD = PlayerData(resource: PlayerResource.defaultResource)
            PlayerData.writeToFile(path: self.documents_player_resource, player: &playerD)
            self.player = playerD
            return
        }
        else {
            self.player = PlayerData.readFromFile(path: self.documents_player_resource)
        }
    }
    
}
