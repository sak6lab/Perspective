//
//  ViewController.swift
//  Perspective
//
//  Created by Saketh D on 3/9/17.
//  Copyright © 2017 Saketh D. All rights reserved.
//

import UIKit
import WebKit

class ArticleViewerVC: UIViewController, WKNavigationDelegate{
    
    @IBOutlet weak var wkView: UIView!
    
    var article: Article!
    var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: article.url)
        let request = NSURLRequest(url: url! as URL)
        
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: wkView.frame.width, height: wkView.frame.height))
        webView.navigationDelegate = self
        webView.load(request as URLRequest)
        wkView.addSubview(webView)
    }

}
