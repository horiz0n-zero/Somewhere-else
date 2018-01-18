//
//  MapCellularAutomata.swift
//  Somewhere else2
//
//  Created by Antoine FeuFeu on 14/01/2018.
//  Copyright © 2018 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit

extension Map {
    
    mutating func applyCellularAutomataEvents() {
     let size = self.header.size - 2
        var table: [(x: Int, y: Int, priority: Int, pos: Int)] = Array(repeating: (0, 0, 0, 0), count: self.header.size * self.header.size)
        var index: Int = 0
        var i: Int = 0
        
        for y in 1...size {
            for x in 1...size {
                if self.grid[y][x].live == 1 {
                    table[index].x = x
                    table[index].y = y
                    table[index].priority = self.grid[y + 1][x + 1].live + self.grid[y + 1][x].live + self.grid[y + 1][x - 1].live +
                        self.grid[y][x + 1].live + self.grid[y][x].live + self.grid[y][x - 1].live +
                        self.grid[y - 1][x + 1].live + self.grid[y - 1][x].live + self.grid[y - 1][x - 1].live
                    table[index].pos = self.grid[y + 1][x + 1].type + self.grid[y + 1][x].type + self.grid[y + 1][x - 1].type +
                        self.grid[y][x + 1].type + self.grid[y][x].type + self.grid[y][x - 1].type +
                        self.grid[y - 1][x + 1].type + self.grid[y - 1][x].type + self.grid[y - 1][x - 1].type
                    index += 1
                }
            }
        }
        if index < self.header.events.requiredTotal {
            print(index, self.header.events.requiredTotal)
            return
        }
        func sortTable(a: (x: Int, y: Int, priority: Int, pos: Int), b: (x: Int, y: Int, priority: Int, pos: Int)) -> Bool {
            return a.pos > b.pos
        }
        
        table.sort(by: sortTable)
        //
        // player spawn
        let pos = table[i]
        /* special case mod later*/
        let entryLink = MapLink(x: pos.x, y: pos.y, settings: self.header.settings, events: self.header.events, size: self.header.size, name: "/home.map")
        self.links!.append(entryLink)
        self.grid[pos.y][pos.x].link = entryLink
        i += 1
        //
        if self.header.events.requiredBuildings != 0 && self.buildings != nil {
            for _ in 0...self.header.events.requiredBuildings - 1 {
                let type = randomIn(self.header.events.range.buildings)
                print(type)
                let build = BuildingSave(type: type, rarity: Probabilities.get3(),
                                        x: table[i].x, y: table[i].y)
                self.buildings!.append(build)
                self.grid[table[i].y][table[i].x].type = 5//base
                self.grid[table[i].y][table[i].x].building = build
                i += 1
            }
        }
        if self.header.events.requiredLinks != 0 && self.links != nil {
            for _ in 1...self.header.events.requiredLinks - 1 {
                let pos = table[i]
                i += 1
                let link = MapLink(x: pos.x, y: pos.y, settings: MapCASettings.randomSettings(),
                                   events: MapCAEvents.randomEvents(), size: 100, name: <#T##String#>)
            }
            
        }
        
    }
    
}

extension Map {
    
    mutating func applyCellularAutomata() {
        
        let settings = self.header.settings
        let size = self.header.size - 1
        let edge = size - 1
        
        if settings.useRandomLiveStart {
            for y in 1...edge {
                for x in 1...edge {
                    if arc4random_uniform(settings.liveRange) == 0 {
                        self.grid[y][x].live = 1
                    }
                    else {
                        self.grid[y][x].live = 0
                    }
                }
            }
        }
        
        if settings.useRandomTypeStart {
            for y in 0...size {
                for x in 0...size {
                    if self.grid[y][x].live == 1 {
                        self.grid[y][x].type = Int(arc4random_uniform(settings.typeRange))
                    }
                }
            }
        }
        
        func gridTurn(x: Int, y: Int, grid: inout [[MapTileProperties]]) {
            let total = self.grid[y + 1][x + 1].live + self.grid[y + 1][x].live + self.grid[y + 1][x - 1].live +
                self.grid[y][x + 1].live + self.grid[y][x - 1].live +
                self.grid[y - 1][x + 1].live + self.grid[y - 1][x].live + self.grid[y - 1][x - 1].live
            if total < Int(settings.turnSurviveValue) {
                grid[y][x].live = 0
            }
            else {
                grid[y][x].live = 1
                if settings.useRandomTypeStart {
                    let types = self.grid[y + 1][x + 1].type + self.grid[y + 1][x].type + self.grid[y + 1][x - 1].type +
                        self.grid[y][x + 1].type + self.grid[y][x - 1].type +
                        self.grid[y - 1][x + 1].type + self.grid[y - 1][x].type + self.grid[y - 1][x - 1].type
                    grid[y][x].type = types / total
                }
            }
        }
        
        if settings.useTurn {
            for _ in 0...settings.turns {
                let row = Array(repeating: MapTileProperties.zero, count: self.header.size)
                var grid = Array(repeating: row, count: self.header.size)
                
                for y in 1...edge {
                    for x in 1...edge {
                        gridTurn(x: x, y: y, grid: &grid)
                    }
                }
                self.grid = grid
            }
        }
    }
    
}










extension Map {
    
    func printMap() {
        
        print(self.header.settings)
        for y in 1...self.header.size - 2 {
            for x in 1...self.header.size - 2 {
                if self.grid[y][x].live == 1 {
                    print(self.grid[y][x].type, separator: "", terminator: " ")
                }
                else {
                    print(" ", separator: "", terminator: " ")
                }
            }
            print()
        }
        print()
    }
    
    func printMapEvent() {
        print(self.header.events)
        for y in 1...self.header.size - 2 {
            for x in 1...self.header.size - 2 {
                if self.grid[y][x].live == 1 {
                    var letter = "*"
                    if let build = self.grid[y][x].building {
                        switch build.type {
                        case .chest:
                            letter = "C"
                        case .totem:
                            letter = "T"
                        default:
                            break
                        }
                    }
                    if let link = self.grid[y][x].link {
                        letter = "#"
                    }
                    
                    print(letter, separator: "", terminator: " ")
                }
                else {
                    print(" ", separator: "", terminator: " ")
                }
            }
            print()
        }
        print()
    }
}


