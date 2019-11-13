//
//  PaymentViewController.swift
//  GameShop
//
//  Created by Max Mendes on 13/11/19.
//  Copyright © 2019 Max Mendes. All rights reserved.
//

import UIKit
import WebKit

class PaymentViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.paypal.com/br/signin")
        
        let requestURL = URLRequest(url: url!)
        
        webView.load(requestURL)

    }
    

   

}
