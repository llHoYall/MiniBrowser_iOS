//
//  ViewController.swift
//  MiniBrowser_iOS
//
//  Created by hoya kim on 10/05/2018.
//  Copyright © 2018 ChameleoN. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
	@IBOutlet weak var bookMarkSegCtrl: UISegmentedControl!
	@IBOutlet weak var urlTextField: UITextField!
	@IBOutlet weak var webView: WKWebView!
	@IBOutlet weak var spinningInd: UIActivityIndicatorView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@IBAction func bookMarkAction(_ sender: Any) {
	}
	
	@IBAction func backAction(_ sender: Any) {
	}
	
	@IBAction func forwardAction(_ sender: Any) {
	}
	
	@IBAction func stopAction(_ sender: Any) {
	}
	
	@IBAction func refreshAction(_ sender: Any) {
	}
}
