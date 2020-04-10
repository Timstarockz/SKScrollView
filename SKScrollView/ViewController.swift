//
//  ViewController.swift
//  SKScrollView
//
//  Created by Tim Desir on 4/9/20.
//  Copyright © 2020 Lunar2 Inc. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
	
	private var skScrollView: SKScrollView!

	override func viewDidLoad() {
		super.viewDidLoad()
		
		// init scroll view
		let sceneSize: CGSize = CGSize(width: 1920, height: 1080)
		skScrollView = SKScrollView(frame: .zero, contentSize: sceneSize)
		skScrollView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(skScrollView)
		NSLayoutConstraint.activate ([
			skScrollView.topAnchor.constraint(equalTo: view.topAnchor),
			skScrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
			skScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			skScrollView.rightAnchor.constraint(equalTo: view.rightAnchor)
		])
		
		// add label
		let hscrollingLabel = SKLabelNode(fontNamed: "HelveticaNeue")
		hscrollingLabel.name = "title"
		hscrollingLabel.text = "SKScrollView"
		hscrollingLabel.fontSize = 70
		hscrollingLabel.fontColor = SKColor.white
		hscrollingLabel.position = .zero
		hscrollingLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
		skScrollView.scene?.addChild(hscrollingLabel)
	}


}

