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
    
    init(data: SceneData) {
        let dataBase = data.documents.appending("/player.player_data")
        if FileManager.default.fileExists(atPath: dataBase) == false {
            FileManager.default.createFile(atPath: dataBase, contents: nil, attributes: nil)
            
            return
        }
        
    }
}

extension PlayerData {
    static func writeToFile(path: String, player: inout PlayerData) {
        guard let file = FileHandle(forWritingAtPath: path) else {
            fatalError()
        }
        
    }
}

extension PlayerData {
    static func readFromFile(path: String) -> PlayerData? {
        return nil
    }
}
