//
//  WebViewController.swift
//  metatagGetSample
//
//  Created by 水野祥子 on 2019/07/06.
//  Copyright © 2019 sachiko. All rights reserved.
//

import UIKit
import WebKit

//https://developer.apple.com/documentation/webkit/wkwebview
class WebViewController: UIViewController, WKUIDelegate {
    
    var addItem:UIBarButtonItem!
    var webView: WKWebView!
    
    override func loadView() {
        
        self.addItem = UIBarButtonItem(title: "追加", style: .done
            , target: self, action: #selector(WebViewController.add))
        self.navigationItem.rightBarButtonItem = addItem
        
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://www.google.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
        items.append(Item())
    
    }
    
    @objc func add(){
        print("ここで追加")
    }
}
