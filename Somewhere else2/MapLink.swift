//
//  MapLink.swift
//  Somewhere else2
//
//  Created by Antoine FeuFeu on 17/01/2018.
//  Copyright © 2018 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit

struct MapLink {
    
    var x: Int
    var y: Int
    var settings: MapCASettings
    var events: MapCAEvents
    var size: Int
    let type: MapDrawType
    let path: String?
    
    static func readMapHeader(path: String) -> MapHeader? {
        guard let file = FileHandle.init(forReadingAtPath: path) else {
            return nil
        }
        var header = MapHeader.init(size: 0, settings: MapCASettings.zero, events: MapCAEvents.zero, type: .Explore)
        let data = file.readData(ofLength: MemoryLayout<MapHeader>.size)
        
        if data.copyBytes(to: UnsafeMutableBufferPointer.init(start: &header, count: MemoryLayout<MapHeader>.size))
            != MemoryLayout<MapLink>.size {
            return nil
        }
        return header
    }
    
    static let zero = MapLink(x: 0, y: 0, settings: MapCASettings.zero, events: MapCAEvents.zero,
                              size: 0, type: .Explore, path: nil)
}


