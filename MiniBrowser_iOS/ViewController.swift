//
//  ViewController.swift
//  MiniBrowser_iOS
//
//  Created by hoya kim on 10/05/2018.
//  Copyright © 2018 ChameleoN. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate, WKNavigationDelegate {
	@IBOutlet weak var bookMarkSegCtrl: UISegmentedControl!
	@IBOutlet weak var urlTextField: UITextField!
	@IBOutlet weak var webView: WKWebView!
	@IBOutlet weak var spinningInd: UIActivityIndicatorView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		let bookmark = bookMarkSegCtrl.titleForSegment(at: bookMarkSegCtrl.selectedSegmentIndex)
		let url = "https://www.\(bookmark!).com"
		webView.navigationDelegate = self
		webView.load(URLRequest(url: URL(string: url)!))		
		urlTextField.text = url
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@IBAction func bookMarkAction(_ sender: Any) {
		let bookmark = bookMarkSegCtrl.titleForSegment(at: bookMarkSegCtrl.selectedSegmentIndex)
		let url = "https://www.\(bookmark!).com"
		webView.load(URLRequest(url: URL(string: url)!))
		urlTextField.text = url
	}
	
	@IBAction func backAction(_ sender: Any) {
		if webView.canGoBack {
			urlTextField.text = webView.backForwardList.backItem?.url.absoluteString
			if urlTextField.text?.range(of: "facebook") != nil {
				bookMarkSegCtrl.selectedSegmentIndex = 0
			} else if urlTextField.text?.range(of: "google") != nil {
				bookMarkSegCtrl.selectedSegmentIndex = 1
			}	else if urlTextField.text?.range(of: "apple") != nil {
				bookMarkSegCtrl.selectedSegmentIndex = 2
			} else if urlTextField.text?.range(of: "twitter") != nil {
				bookMarkSegCtrl.selectedSegmentIndex = 3
			}
			webView.goBack()
		}
	}
	
	@IBAction func forwardAction(_ sender: Any) {
		if webView.canGoForward {
			urlTextField.text = webView.backForwardList.forwardItem?.url.absoluteString
			if urlTextField.text?.range(of: "facebook") != nil {
				bookMarkSegCtrl.selectedSegmentIndex = 0
			} else if urlTextField.text?.range(of: "google") != nil {
				bookMarkSegCtrl.selectedSegmentIndex = 1
			}	else if urlTextField.text?.range(of: "apple") != nil {
				bookMarkSegCtrl.selectedSegmentIndex = 2
			} else if urlTextField.text?.range(of: "twitter") != nil {
				bookMarkSegCtrl.selectedSegmentIndex = 3
			}
			webView.goForward()
		}
	}
	
	@IBAction func stopAction(_ sender: Any) {
		webView.stopLoading()
	}
	
	@IBAction func refreshAction(_ sender: Any) {
		webView.reload()
	}
	
	func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
		spinningInd.startAnimating()
	}
	
	func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
		spinningInd.stopAnimating()
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		var url = "\(urlTextField.text!)"
		if !url.hasPrefix("https://") {
			url = "https://\(urlTextField.text!)"
		}
		webView.load(URLRequest(url: URL(string: url)!))
		textField.resignFirstResponder()
		return true
	}
}
