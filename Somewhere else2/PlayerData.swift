//
//  PlayerData.swift
//  Somewhere else2
//
//  Created by Antoine FeuFeu on 14/01/2018.
//  Copyright © 2018 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit

struct PlayerData {
    
    var resource: PlayerResource
    var map: PlayerMapData
    
    init(resource: PlayerResource) {
        self.resource = resource
        self.map = PlayerMapData.zero
    }
}

extension PlayerData {
    static func writeToFile(path: String, player: inout PlayerData) {
        print("write player data")
        guard let file = FileHandle(forWritingAtPath: path) else {
            fatalError()
        }
        let resourceData = Data.init(bytesNoCopy: &player.resource, count: MemoryLayout<PlayerResource>.size, deallocator: .none)
        file.write(resourceData)
    }
}

extension PlayerData {
    static func readFromFile(path: String) -> PlayerData {
        print("read player data")
        let fd = open(path, O_RDONLY)
        var resource = PlayerResource.defaultResource
        
        if fd == -1 {
            fatalError()
        }
        read(fd, &resource, MemoryLayout<PlayerResource>.size)
        return PlayerData(resource: resource)
    }
}
