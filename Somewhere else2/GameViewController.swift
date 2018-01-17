//
//  GameViewController.swift
//  Somewhere else2
//
//  Created by Antoine FeuFeu on 14/01/2018.
//  Copyright © 2018 Antoine FeuFeu. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    var data: SceneData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.data = SceneData()
        self.data.controller = self
        let debugSettings = MapCASettings(useRandomLiveStart: true, useRandomTypeStart: true, useTurn: true,
                                          liveRange: 2, typeRange: 5, turns: 2, turnSurviveValue: 4)
        let debugEvents = MapCAEvents(buildings: 20, links: 0, items: 0)
        var map = Map(size: 50, settings: debugSettings, events: debugEvents)
        map.applyCellularAutomata()
        map.applyCellularAutomataEvents()
        let path = self.data.documents_maps.appending("/home.map")
        Map.WriteToFile(path: path, map: &map)
        map.printMapEvent()
        self.presentScene(byLoadingMapAtPath: path)
    }

    func presentScene(byLoadingMapAtPath path: String) {
        
        let scene = Scene(size: self.view.frame.size, data: self.data)
        scene.scaleMode = .aspectFill
        (self.view as! SKView).presentScene(scene)
        scene.map = Map.ReadFromFile(path: path)
        scene.map.printMap()
        scene.map.printMapEvent()
        
        switch scene.map.header.type {
        case .Explore:
            scene.drawMapExplore()
        }
        
        
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
