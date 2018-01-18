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
    var objects: [MapItem]!
    var buildings: [BuildingSave]?
    var links: [MapLink]?

    init(size: Int, settings: MapCASettings, events: MapCAEvents) {
        self.header = MapHeader(size: size, settings: settings, events: events, type: .Explore)
        let row = Array(repeating: MapTileProperties.zero, count: size)
        self.grid = Array(repeating: row, count: size)
        if events.requiredBuildings != 0 {
            self.buildings = [BuildingSave]()
        }
        else {
            self.buildings = nil
        }
        if events.requiredLinks != 0 {
            self.links = [MapLink]()
        }
        else {
            self.links = nil
        }
    }
    
    init() {
        self.header = MapHeader(size: 0, settings: MapCASettings.zero, events: MapCAEvents.zero, type: .Explore)
        self.grid = [[MapTileProperties]]()
        self.buildings = nil
        self.links = nil
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
            file.closeFile()
        }
        guard let file = FileHandle(forWritingAtPath: path) else {
            fatalError("Bad file to write")
        }
        file.write(Data.init(bytesNoCopy: &map.header, count: MemoryLayout<MapHeader>.size, deallocator: .none))
        for var tiles in map.grid {
            let data = Data(bytesNoCopy: &tiles, count: map.header.row_size, deallocator: .none)
            file.write(data)
        }
        if map.header.events.requiredBuildings != 0 && map.buildings != nil {
            for var build in map.buildings! {
                let data = Data(bytesNoCopy: &build, count: MemoryLayout<BuildingSave>.size, deallocator: .none)
                file.write(data)
            }
        }
        if map.header.events.requiredLinks != 0 && map.links != nil {
            for var link in map.links! {
                let data = Data(bytesNoCopy: &link, count: MemoryLayout<MapLink>.size, deallocator: .none)
                file.write(data)
            }
        }
        file.closeFile()
    }
}

extension Map {
    static func ReadFromFile(path: String) -> Map? {
        var map = Map()
        guard let file = FileHandle(forReadingAtPath: path) else {
            fatalError()
        }
        let header = file.readData(ofLength: MemoryLayout<MapHeader>.size)
        if header.copyBytes(to: UnsafeMutableBufferPointer.init(start: &map.header, count: MemoryLayout<MapHeader>.size))
            != MemoryLayout<MapHeader>.size {
            fatalError()
        }
        for _ in 1...map.header.size {
            var row = Array(repeating: MapTileProperties.zero, count: map.header.size)
            let data = file.readData(ofLength: map.header.row_size)
            if data.copyBytes(to: UnsafeMutableBufferPointer.init(start: &row, count: map.header.row_size))
                != map.header.row_size {
                fatalError()
            }
            map.grid.append(row)
        }
        if map.header.events.requiredBuildings != 0 {
            if map.buildings == nil {
                map.buildings = [BuildingSave]()
            }
            var i = 0
            while i < map.header.events.requiredBuildings {
                let data = file.readData(ofLength: MemoryLayout<BuildingSave>.size)
                var save = BuildingSave.init(type: .totem, rarity: .common, x: 0, y: 0)
                if data.copyBytes(to: UnsafeMutableBufferPointer.init(start: &save, count: MemoryLayout<BuildingSave>.size))
                    != MemoryLayout<BuildingSave>.size {
                    fatalError()
                }
                map.buildings!.append(save)
                i += 1
            }
        }
        if map.header.events.requiredLinks != 0 {
            if map.links == nil {
                map.links = [MapLink]()
            }
            var i = 0
            while i < map.header.events.requiredLinks {
                let data = file.readData(ofLength: MemoryLayout<MapLink>.size)
                print(MemoryLayout<MapLink>.size)
                var save = MapLink.zero
                if data.copyBytes(to: UnsafeMutableBufferPointer.init(start: &save, count: MemoryLayout<MapLink>.size))
                    != MemoryLayout<MapLink>.size {
                    fatalError()
                }
                map.links!.append(save)
                i += 1
            }
        }
        file.closeFile()
        
        return map
    }
}








