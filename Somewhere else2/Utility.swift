//
//  Utility.swift
//  Somewhere else2
//
//  Created by Antoine FeuFeu on 17/01/2018.
//  Copyright © 2018 Antoine FeuFeu. All rights reserved.
//

import Foundation
import SpriteKit

func /(lhs: CGSize, rhs: CGSize) -> CGSize {
    return CGSize(width: lhs.width / rhs.width, height: lhs.height / rhs.height)
}

func /(lhs: CGSize, rhs: CGFloat) -> CGSize {
    return CGSize(width: lhs.width / rhs, height: lhs.height / rhs)
}

func *(lhs: CGSize, rhs: CGSize) -> CGSize {
    return CGSize(width: lhs.width * rhs.width, height: lhs.height * rhs.height)
}

func *(lhs: CGSize, rhs: CGFloat) -> CGSize {
    return CGSize(width: lhs.width * rhs, height: lhs.height * rhs)
}

func randomFrom(_ range: Int) -> Int {
    return Int(arc4random_uniform(UInt32(range)))
}

func randomIn<T>(_ range: [T]) -> T {
    let r = Int(arc4random_uniform(UInt32(range.count)))
    
    return range[r]
}
