//
//  NetworkingFile.swift
//  StockPrice
//
//  Created by 刘益宏 on 4/10/22.
//

import Foundation
import PromiseKit
import Alamofire
import SwiftyJSON


extension ViewController {
    
    func getStock(_ url : String) -> Promise<StockModel>{
        
        return Promise<StockModel> { seal -> Void in
            //SwiftSpinner.show("Getting Stock Value for \(symbol)")
            AF.request(url).responseJSON { response in
                if response.error != nil {
                    print(response.error!)
                    return
                }
                // If I am here then I have got the data
                
                let stocks = JSON(response.data!).array
                
                guard let stock = stocks!.first else { return}
                
                print(stock)
                
                let quote = StockModel("", "")
                
                quote.symbol = stock["symbol"].stringValue
                quote.price = stock["price"].floatValue
                quote.dayLow = stock["dayLow"].floatValue
                quote.dayHigh = stock["dayHigh"].floatValue
                quote.name = stock["name"].stringValue
                
                self.lblName.text = "\(quote.name)"
                self.lblSymbol.text = "\(quote.symbol)"
                self.lblPrice.text = "\(quote.price)"
                self.lblDayLow.text = "\(quote.dayLow)"
                self.lblDayHigh.text = "\(quote.dayHigh)"
                
                seal.fulfill(quote)
            }
        }
    }
    
}
