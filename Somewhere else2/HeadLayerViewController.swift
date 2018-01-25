//
//  HeadLayerViewController.swift
//  Somewhere else2
//
//  Created by Antoine FeuFeu on 19/01/2018.
//  Copyright © 2018 Antoine FeuFeu. All rights reserved.
//

import UIKit
import SpriteKit


class HeadLayerViewController: UIViewController {

    
    @IBOutlet weak var headCreatureName: UILabel!
    
    @IBOutlet weak var HeadCreatureImage: UIImageView!
    
    static let head_textures: [SKTexture] = [
        SKTexture.init(imageNamed: "headCreature"),
        SKTexture.init(imageNamed: "headHero"),
        SKTexture.init(imageNamed: "headSpirit")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadCreature(texture: SKTexture, name: String) {
        self.headCreatureName.text = name
        self.HeadCreatureImage.image = UIImage(cgImage: texture.cgImage())
    }
}
