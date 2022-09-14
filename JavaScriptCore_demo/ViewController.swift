//
//  ViewController.swift
//  JavaScriptCore_demo
//
//  Created by wangwenjian on 2022/9/2.
//

import UIKit
import JavaScriptCore
import WebKit

class ViewController: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        _ = webView
        let path = Bundle.main.path(forResource: "chchar", ofType: "html")
        let url = URL(fileURLWithPath: path!)
        let dir =  URL(string: "file://")!
        webView.loadFileURL(url, allowingReadAccessTo: dir);
    }


    lazy var webView : WKWebView = {
        let preferences = WKPreferences()
        preferences.setValue(true, forKey:"allowFileAccessFromFileURLs")
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        let webView = WKWebView(frame: CGRect(x: 30, y: 100, width: 240, height: 240), configuration: configuration)
        webView.allowsBackForwardNavigationGestures = true
        webView.navigationDelegate = self
        view.addSubview(webView)
        return webView
    }()
    
}

extension UIViewController :WKNavigationDelegate {
//    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        webView.evaluateJavaScript("drawAction()") { obj, error in
//
//        }
//    }
}
