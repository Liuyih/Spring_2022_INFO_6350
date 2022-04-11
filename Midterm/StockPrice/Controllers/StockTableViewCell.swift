//
//  StockTableViewCell.swift
//  StockPrice
//
//  Created by 刘益宏 on 4/10/22.
//

import UIKit
import SwiftyJSON
import SwiftSpinner
import Alamofire
import PromiseKit

class StockTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSymbol: UILabel!
    
    var sendStockDelegate : SendStockDelegate?
    
    var symbol = ""
    
    @IBAction func getPriceAction(_ sender: Any) {
        let url = "\(quoteURL)\(symbol.uppercased())?apikey=\(apiKey)"
        
        print(url)
        
        getStock(url).done { stockModel in
            stockModel.symbol = self.symbol
            self.sendStockDelegate?.sendStockData(stockModel)
        }
        .catch{error in
            print(error.localizedDescription)
        }

    }
    
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
                
                seal.fulfill(quote)
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
}
