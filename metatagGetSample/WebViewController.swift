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
    }
    
    @objc func add(){
        self.webView?.evaluateJavaScript("document.getElementsByTagName('html')[0].innerHTML", completionHandler: { (html, error) -> Void in
            if let html = html{
                let metas = htmlPaser.parse(htmlString: html as! String)
                let parseMetas = htmlPaser.parseMetasGet(htmlString: html as! NSString, textCheckingResults:metas)
                
                let title = parseMetas["og:title"] ?? "titleなし"
                let description = parseMetas["og:description"] ?? "詳細内容なし"
                let image = parseMetas["og:image"] ?? ""
                let url = parseMetas["og:url"] ?? ""
                
                let item = Item(title: title, discription: description, image: image, url: url)
                
                items.append(item)
                
            }
            
            if let error = error{
                let errorText = error.localizedDescription
                print("\(errorText)")
            }
        })
    }
}
