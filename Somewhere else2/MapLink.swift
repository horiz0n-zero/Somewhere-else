//
//  MapLink.swift
//  Somewhere else2
//
//  Created by Antoine FeuFeu on 17/01/2018.
//  Copyright © 2018 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit

enum MapContext: Int {
    case exploring = 0
    case explored = 1
    case house = 2
}

struct MapLink {
    
    var x: Int
    var y: Int
    var settings: MapCASettings
    var events: MapCAEvents
    var size: Int
    let name: String
    
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
    
    static func initFromPath(path: String) -> MapLink? {
        guard let header = MapLink.readMapHeader(path: path) else {
            return nil
        }
        let link = MapLink(x: 0, y: 0, settings: header.settings, events: header.events, size: header.size, name: "")
        return link
    }
    static let zero = MapLink(x: 0, y: 0, settings: MapCASettings.zero, events: MapCAEvents.zero, size: 0, name: "")
    
}


