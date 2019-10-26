//
//  ViewController.swift
//  BitcoinPriceTracker
//
//  Created by muhammad Awais on 10/20/19.
//  Copyright © 2019 muhammad Awais. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let url = URL(string: "https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD,JPY,EUR") {
            URLSession.shared.dataTask(with: url) { (data: Data?, response:URLResponse?, error:Error?) in
                if error == nil {
                    if data != nil {
                        if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as?
                            [String:Double] {
                            if let usdPrice = json["USD"] {
                                print(usdPrice)
                            }
                            if let eurPrice = json["EUR"] {
                                print(usdPrice)
                            }
                        }
                    }
                }
                else
                {
                    print("we have a problem")
                }
            }.resume()
        }
    }


}

