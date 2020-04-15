//
//  ViewController.swift
//  SwiftyReview
//
//  Created by Eric Conner Apps on 10/30/2017.
//  Copyright (c) 2017 Eric Conner Apps. All rights reserved.
//

import UIKit
import SwiftyReview

class ViewController: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		SwiftyReview.requestReview(requestsBeforeAlert: 5)
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}
