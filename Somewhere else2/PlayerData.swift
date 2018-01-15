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
    
    init(resource: PlayerResource) {
        self.resource = resource
    }
    
}

extension PlayerData {
    static func writeToFile(path: String, player: inout PlayerData) {
        guard let file = FileHandle(forWritingAtPath: path) else {
            fatalError()
        }
        let resourceData = Data.init(bytesNoCopy: &player.resource, count: MemoryLayout<PlayerResource>.size, deallocator: .none)
        file.write(resourceData)
    }
}

extension PlayerData {
    static func readFromFile(path: String) -> PlayerData {
        let fd = open(path, O_RDONLY)
        var resource = PlayerResource.defaultResource
        
        if fd == -1 {
            fatalError()
        }
        read(fd, &resource, MemoryLayout<PlayerResource>.size)
        return PlayerData(resource: resource)
    }
}
