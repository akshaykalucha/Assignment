//
//  WebViewVC.swift
//  Assignment
//
//  Created by Akshay Kalucha on 16/07/22.
//

import UIKit
import WebKit
import Foundation

class WebViewVC: UIViewController {

    @IBOutlet weak var webvView: WKWebView!
    var urltoload = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        urltoload = urltoload.trimmingCharacters(in: .whitespaces) // trim url to avoid url error
        if urltoload == "" {
            urltoload = "https://www.twitter.com/aksxayy" // set a default url
        }
        
        let request = URLRequest(url: URL(string: urltoload)!)
        webvView?.load(request)
    }
    

    @IBAction func action_back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
