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
            return a.priority > b.priority || a.pos < b.pos
        }
        table.sort(by: sortTable)
        if self.header.events.requiredBuildings != 0 && self.buildings != nil {
            for i in 0...self.header.events.requiredBuildings - 1 {
                let type = BuildingType(rawValue: Int(arc4random_uniform(2)))!
                let build = BuildingSave(type: type, rarity: Rarities(rawValue: Int(arc4random_uniform(3)))!,
                                        x: table[i].x, y: table[i].y)
                
                self.buildings!.append(build)
                self.grid[table[i].y][table[i].x].building = build
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


