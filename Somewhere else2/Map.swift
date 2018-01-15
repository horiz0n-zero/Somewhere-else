//
//  Map.swift
//  Somewhere else2
//
//  Created by Antoine FeuFeu on 14/01/2018.
//  Copyright © 2018 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit

struct Map {
    var header: MapHeader
    var grid: [[MapTileProperties]]
    
    init(size: Int, settings: MapCASettings, events: MapCAEvents) {
        self.header = MapHeader(size: size, settings: settings, events: events, type: .Explore)
        let row = Array(repeating: MapTileProperties.zero, count: size)
        self.grid = Array(repeating: row, count: size)
    }
    
    init() {
        self.header = MapHeader(size: 0, settings: MapCASettings.zero, events: MapCAEvents(), type: .Explore)
        self.grid = [[MapTileProperties]]()
    }
}

extension Map {
    static func WriteToFile(path: String, map: inout Map) {
        if FileManager.default.fileExists(atPath: path) == false {
            FileManager.default.createFile(atPath: path, contents: nil, attributes: nil)
        }
        else {
            guard let file = FileHandle.init(forUpdatingAtPath: path) else {
                fatalError()
            }
            file.truncateFile(atOffset: 0)
        }
        guard let file = FileHandle(forWritingAtPath: path) else {
            fatalError("Bad file to write")
        }
        file.write(Data.init(bytesNoCopy: &map.header, count: MemoryLayout<MapHeader>.size, deallocator: .none))
        for i in 0...map.header.size - 1 {
            file.write(Data.init(bytesNoCopy: &map.grid[i], count: map.header.row_size, deallocator: .none))
        }
    }
}

extension Map {
    static func ReadFromFile(path: String) -> Map {
        var map = Map()
        let fd = open(path, O_RDONLY)
        
        if fd == -1 {
            fatalError()
        }
        
        read(fd, &map.header, MemoryLayout<MapHeader>.size)
        for _ in 0...map.header.size - 1 {
            
            var row = Array(repeating: MapTileProperties.zero, count: map.header.size)
            read(fd, &row, map.header.row_size)
            map.grid.append(row)
        }
        return map
    }
}








