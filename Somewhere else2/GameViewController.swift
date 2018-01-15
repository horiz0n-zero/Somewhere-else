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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var data = SceneData()
        data.controller = self
        data.player = PlayerData(data: data)
        
        
        let view = self.view as! SKView
        let scene = Scene(size: view.frame.size, data: data)
        scene.scaleMode = .aspectFill
        
        view.presentScene(scene)
        view.ignoresSiblingOrder = true
         
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
