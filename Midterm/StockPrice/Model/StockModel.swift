//
//  Quote.swift
//  StockPrice
//
//  Created by 刘益宏 on 4/10/22.
//

import Foundation

class StockModel {
    
    init(_ symbol : String, _ name : String){
            self.symbol = symbol
            self.name = name
        }
    
    var name : String = ""
    var symbol : String = ""
    var price : Float = 0.0
    var dayLow : Float = 0.0
    var dayHigh : Float = 0.0
}
