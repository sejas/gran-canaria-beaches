//
//  WebViewController.swift
//  Playas
//
//  Created by Antonio Sejas on 20/8/16.
//  Copyright © 2016 Antonio Sejas. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var web: UIWebView!
    var urlString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
        
        web.delegate = self
        if let url = NSURL (string: urlString) {
            let request = NSURLRequest(URL: url);
            web.loadRequest(request);
        }
       
    }
    
    //Mark: Delegate WebView
    func webViewDidStartLoad(webView: UIWebView) {
        SpinnerView.showLoading(self)
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        SpinnerView.removeLoading(self)
    }
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        if let error = error {
                CustomAlert.showError(self, title: "Error loading web", message: error.localizedDescription)
        }
    }
    
    
    

}
