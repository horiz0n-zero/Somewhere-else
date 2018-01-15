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
            self.printMap()
        }
        
        if settings.useRandomTypeStart {
            for y in 0...size {
                for x in 0...size {
                    if self.grid[y][x].live == 1 {
                        self.grid[y][x].type = Int(arc4random_uniform(settings.typeRange))
                    }
                }
            }
            self.printMap()
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
                self.printMap()
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
                    
                }
                else {
                    print(" ", separator: "", terminator: " ")
                }
            }
        }
    }
}


