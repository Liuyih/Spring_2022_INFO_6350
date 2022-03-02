//
//  StockViewController.swift
//  NailStocks
//
//  Created by 刘益宏 on 2/20/22.
//

import UIKit
import SwiftyJSON
import SwiftSpinner
import Alamofire

class StockViewController: UIViewController {

    @IBOutlet weak var txtStockSymbol: UITextField!
    
    @IBOutlet weak var lblStockPrice: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func getStockPrice(_ sender: Any) {
        let symbol: String = txtStockSymbol.text!.uppercased()
        
        let url = "\(quoteURL)\(symbol)?apikey=\(apiKey)"
        
        print(url)
        
        SwiftSpinner.show("Getting the year's highest stock value for \(symbol)")
        
        AF.request(url).responseJSON {response in
            SwiftSpinner.hide(nil)
            if response.error != nil {
                print(response.error!)
                return
            }
            
            let stocks = JSON(response.data!).array
            
            guard let stock = stocks!.first else {
                return
            }
            
            print(stock)
            
            let quote = Quote()
            
            quote.symbol = stock["symbol"].stringValue
            quote.price = stock["yearHigh"].floatValue
            quote.volume = stock["volume"].intValue
            
            self.lblStockPrice.text = "\(quote.symbol), yearHigh: \(quote.price) $"
            
            //print("stock price is: \(stocks[0]["price"])")
            
            //lblStockPrice = stocks[0]["price"]
            
        }
    
    
    }


}
