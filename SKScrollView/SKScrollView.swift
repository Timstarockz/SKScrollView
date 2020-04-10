//
//  SKScrollView.swift
//  SKScrollView
//
//  Created by Tim Desir on 4/9/20.
//  Copyright © 2020 Lunar2 Inc. All rights reserved.
//

import UIKit
import SpriteKit

class SKScrollView: UIView {

    // MARK: - Variables & Initialization
	
	private(set) var skView: SKView!
	private(set) var scrollView: UIScrollView!
	
	private var cameraNode: SKCameraNode!
	
	private(set) weak var scene: SKScene? = nil
	private(set) var contentSize: CGSize = .zero
		
	// --
	
	init(frame: CGRect, contentSize: CGSize) {
		super.init(frame: frame)
		self.contentSize = contentSize
		self.backgroundColor = UIColor(white: 0.1, alpha: 1.0)
		
		// init scroll view
		scrollView = UIScrollView(frame: .zero)
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		scrollView.contentSize = CGSize(width: contentSize.width, height: contentSize.height)
		scrollView.clipsToBounds = true
		scrollView.maximumZoomScale = 10.0
		scrollView.minimumZoomScale = 1.0
		//scrollView.showsVerticalScrollIndicator = false
		//scrollView.showsHorizontalScrollIndicator = false
		addSubview(scrollView)
		NSLayoutConstraint.activate ([
			scrollView.topAnchor.constraint(equalTo: topAnchor),
			scrollView.leftAnchor.constraint(equalTo: leftAnchor),
			scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
			scrollView.rightAnchor.constraint(equalTo: rightAnchor)
		])
		
		// init sk view
		skView = SKView(frame: .zero)
		skView.translatesAutoresizingMaskIntoConstraints = false
		skView.showsPhysics = true
		scrollView.addSubview(skView)
		NSLayoutConstraint.activate ([
			skView.topAnchor.constraint(equalTo: topAnchor),
			skView.leftAnchor.constraint(equalTo: leftAnchor),
			skView.bottomAnchor.constraint(equalTo: bottomAnchor),
			skView.rightAnchor.constraint(equalTo: rightAnchor)
		])
		
		// init scene
		let scene: SKScene? = SKScene(fileNamed: "MyScene")
		scene?.scaleMode = .resizeFill
		skView.presentScene(scene)
		self.scene = scene
		
		// init camera node
		cameraNode = SKCameraNode()
		self.scene?.camera = cameraNode

		//
		let hdif = (contentSize.height - scrollView.bounds.size.height) / 2
		let vdif = (contentSize.width - scrollView.bounds.size.width) / 2
		self.cameraNode.position = CGPoint(x: 0 - vdif, y: (0 - hdif) * -1)
		
		//
		let centerOffsetX = (scrollView.contentSize.width - scrollView.frame.size.width) / 2
		let centerOffsetY = (scrollView.contentSize.height - scrollView.frame.size.height) / 2
		let centerPoint = CGPoint(x: centerOffsetX, y: centerOffsetY)
		scrollView.setContentOffset(centerPoint, animated: false)
		
		//
		scrollView.delegate = self
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Layout
	
	override func layoutSubviews() {
	}
	
}

// MARK: - UIScrollViewDelegate

extension SKScrollView: UIScrollViewDelegate {
	
	// MARK: Scrolling
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		let contentOffset = scrollView.contentOffset
		let hdif = (contentSize.height/2)-(scrollView.bounds.size.height/2)
		let vdif = (contentSize.width/2)-(scrollView.bounds.size.width/2)
		
		self.cameraNode.position = CGPoint(x: contentOffset.x - vdif, y: (contentOffset.y - hdif) * -1)
		
		
//		let offsetX = max((scrollView.bounds.width - scrollView.contentSize.width) * 0.5, 0)
//		let offsetY = max((scrollView.bounds.height - scrollView.contentSize.height) * 0.5, 0)
//		scrollView.contentInset = UIEdgeInsets(top: offsetY, left: offsetX, bottom: 0, right: 0)
	}
	
	// MARK: Zooming
	
	func viewForZooming(in scrollView: UIScrollView) -> UIView? {
		return nil
	}
	
	func scrollViewDidZoom(_ scrollView: UIScrollView) {
//		let offsetX = max((scrollView.bounds.width - scrollView.contentSize.width) * 0.5, 0)
//		let offsetY = max((scrollView.bounds.height - scrollView.contentSize.height) * 0.5, 0)
//		scrollView.contentInset = UIEdgeInsets(top: offsetY, left: offsetX, bottom: 0, right: 0)
	}
	
	func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
		//self.cameraNode.setScale(0.1)
	}
	
}
