//
//  CustomWebViewController.swift
//  TopTracksDemo
//
//  Created by Jonathan Engelsma on 5/26/15.
//  Copyright (c) 2015 Jonathan Engelsma. All rights reserved.
//

import UIKit

class CustomWebViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    var webUrl : String = "www.google.com"
    var _webActivityIndicator : UIActivityIndicatorView?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let activity : UIBarButtonItem = UIBarButtonItem(customView: self.webActivityIndicator())
        
        let safari : UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Action, target: self, action: "viewInSafari")
        
        self.navigationItem.rightBarButtonItems = [safari,activity]
        
        let theUrl : NSURL? = NSURL(string: self.webUrl)
        
        let request : NSMutableURLRequest? = NSMutableURLRequest(URL: theUrl!, cachePolicy: NSURLRequestCachePolicy.UseProtocolCachePolicy, timeoutInterval: 10)
        
        request!.HTTPMethod = "GET"
        self.webView!.delegate = self
        self.webView.loadRequest(request!)


    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        if self.webView.loading {
            self.webView.stopLoading()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func webActivityIndicator() -> UIActivityIndicatorView
    {
        if self._webActivityIndicator == nil {
            self._webActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
            self._webActivityIndicator?.hidesWhenStopped = true
        }
        return self._webActivityIndicator!
    }
    
    func viewInSafari() {
        //new activityController
        let URL:NSURL = NSURL(string: self.webUrl)!
        let activityTU = TUSafariActivity()

        let activityViewController = UIActivityViewController(activityItems: [URL], applicationActivities: [activityTU])
        
        presentViewController(activityViewController, animated: true, completion: nil)
    }
    
    func backPressed() {
        if self.webView.canGoBack {
            self.webView.goBack()
        }
    }
    
    func updateBackButton() {
        if self.webView.canGoBack {
            if self.navigationItem.leftBarButtonItem == nil {
                self.navigationItem.hidesBackButton = true
                let backItem : UIBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: self, action: "backPressed")
                self.navigationItem.leftBarButtonItem = backItem
            }
        } else {
                self.navigationItem.leftBarButtonItem = nil
                self.navigationItem.hidesBackButton = false
        }
    }

    func webViewDidStartLoad(webView: UIWebView)
    {
        self.webActivityIndicator().startAnimating()
        self.updateBackButton()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        self.webActivityIndicator().stopAnimating()
        self.updateBackButton()
    }

    func webView(webView: UIWebView,
        didFailLoadWithError error: NSError) {
            self.webActivityIndicator().stopAnimating()
            println("error loading page!")
    }
    

}
