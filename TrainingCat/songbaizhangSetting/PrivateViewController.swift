//
//  PrivateViewController.swift
//  TrainingCat
//
//  Created by crespo on 2020/3/12.
//  Copyright © 2020 crespo. All rights reserved.
//

import UIKit
import WebKit
class PrivateViewController: UIViewController {

    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "隐私政策"
        self.view.backgroundColor = UIColor(hexString: "#f5f5f5")
        self.navigationController?.navigationBar.tintColor = .white
        // Do any additional setup after loading the view.
        webView = WKWebView.init(frame: self.view.bounds, configuration: WKWebViewConfiguration.init())
        self.view.addSubview(webView)
        webView.backgroundColor = .white
        let url = NSURL.init(string: "https://guanzejinshu.com/private.html")
        guard let priveteUrl = url else {
            return
        }
        webView.load(URLRequest.init(url: priveteUrl as URL))
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
