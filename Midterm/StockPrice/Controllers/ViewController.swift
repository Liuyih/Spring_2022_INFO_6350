//
//  ViewController.swift
//  StockPrice
//
//  Created by 刘益宏 on 4/10/22.
//

import UIKit
import SwiftyJSON
import SwiftSpinner
import Alamofire
import PromiseKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SendStockDelegate {
    
    //let stocks = ["Meta", "Apple", "Google", "Microsoft", "Amazon"]

    override func viewDidLoad() {
        super.viewDidLoad()
        stocksModel = initializeCities()
        let url = "https://financialmodelingprep.com/api/v3/quote/AAPL?apikey=84e507496765e1ccffa74864f464399b"
        getStock(url)
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblSymbol: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var lblDayHigh: UILabel!
    
    @IBOutlet weak var lblDayLow: UILabel!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    /////
    
    @IBOutlet weak var tblView: UITableView!
    
    var stocksModel : [StockModel]?
    
    func initializeCities() -> [StockModel]{
       
        let Meta = StockModel("FB", "Meta");
        let Apple = StockModel("AAPL", "Apple");
        let Google = StockModel("GOOG", "Google");
        let Microsoft = StockModel("MSFT", "Microsoft");
        let Amazon = StockModel("AMZN", "Amazon");
        

        var modelArr = [StockModel]()
        
        
        modelArr.append(Meta)
        modelArr.append(Apple)
        modelArr.append(Google)
        modelArr.append(Microsoft)
        modelArr.append(Amazon)
        
        return modelArr
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rows = stocksModel?.count else { return 0 }
        print(rows)
                return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("StockTableViewCell", owner: self, options: nil)?.first as! StockTableViewCell

        guard let stockModel = stocksModel?[indexPath.row] else {return cell}
        
        
        cell.lblSymbol.text = stockModel.symbol
        
        cell.lblName.text = stockModel.name
        
        cell.symbol = stockModel.symbol
        
        cell.sendStockDelegate = self
        
        return cell
    }
    
    func sendStockData(_ stockModel: StockModel) {
        lblName.text = stockModel.name
        print(stockModel.name)
        lblSymbol.text = stockModel.symbol
        lblPrice.text = "\(stockModel.price)"
        lblDayLow.text = "\(stockModel.dayLow)"
        lblDayHigh.text = "\(stockModel.dayHigh)"
    }
    
}

