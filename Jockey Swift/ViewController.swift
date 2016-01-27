//
//  ViewController.swift
//  Jockey Swift
//
//  Created by Yuttana Kungwon on 1/27/2559 BE.
//  Copyright © 2559 E-Commerce Solution Co., Ltd. All rights reserved.
//

import UIKit
import JockeyJS

class ViewController: UIViewController, UIWebViewDelegate {


    @IBOutlet weak var myWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let urlRequest = NSURLRequest(URL: NSURL(string: "http://jitta.com")!)
        myWebView.delegate = self
        myWebView.loadRequest(urlRequest)
        
        // listening.
        Jockey.on("event-name") { ( payload : [NSObject : AnyObject]!) -> Void in
            print(payload)
        }
        
        
        let userAgent = UIWebView().stringByEvaluatingJavaScriptFromString("navigator.userAgent")
        print("Current user-agent \(userAgent!)")
    }
    
    override func viewDidDisappear(animated: Bool) {
        Jockey.off("event-name")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return Jockey.webView(webView, withUrl: request.URL!)
    }
    

    
    func webViewDidStartLoad(webView: UIWebView) {
        print("Start loading...")
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        print("Finish loading!")
    }

}

