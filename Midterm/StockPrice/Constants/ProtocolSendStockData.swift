//
//  ProtocolSendStockData.swift
//  StockPrice
//
//  Created by 刘益宏 on 4/10/22.
//

import Foundation

protocol SendStockDelegate {
    func sendStockData (_ stockModel : StockModel)
}
